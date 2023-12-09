class V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: %i[index create]

  def index
    @response = []
    @reservations = Reservation.where(user_id: @current_user.id)
    @serialized_doctors = ReservationSerializer.new(@reservations).serializable_hash[:data]
    if @serialized_doctors.empty?
      render json: { error: 'not found', error_message: ['No reservations found'] }, status: :not_found
    else
      @serialized_doctors.each do |appointment|
        @response << {
          id: appointment[:id],
          doctor: Doctor.find(appointment[:attributes][:doctor_id]),
          user_id: appointment[:attributes][:user_id],
          date_of_appointment: appointment[:attributes][:date_of_appointment],
          imageUrl: Doctor.find(appointment[:attributes][:doctor_id]).image_url

        }
      end
      render json: { data: @response, message: ['All reservations loaded'] }, status: :ok
    end
  end

  def destroy
    appointment = User.find(@current_user.id).reservations.find(params[:id]).destroy!

    render json: { data: appointment, message: ['Reservation deleted'] }, status: :ok if appointment.destroyed?
  rescue StandardError => e
    render json: { error: 'not found', error_message: ["Reservation not found #{e}"] }, status: :not_found
  end

  def create
    appointment = Reservation.new(reservation_params)
    if appointment.save
      response = { doctor_id: appointment.doctor_id,
                   date_of_appointment: appointment.date_of_appointment.strftime('%A, %d %B %Y') }
      render json: { data: response, message: 'Reservation created' }, status: :created
    else
      render json: { error: 'forbidden', error_message: appointment.errors }, status: :forbidden
    end
  end

  def reservation_params
    post_params = params.permit(:doctor_id, :date_of_appointment)
    post_params[:user_id] = @current_user.id
    post_params
  end
end
