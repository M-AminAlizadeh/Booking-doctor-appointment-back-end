require 'open-uri'

class V1::DoctorsController < ApplicationController
  before_action :authorize_request, only: %i[index show create destroy]

  def index
    @response = []
    @doctors = Doctor.all
    @serialized_doctors = DoctorSerializer.new(@doctors).serializable_hash[:data]

    if @serialized_doctors.empty?
      render json: { error: 'not found', error_message: ['No doctors found'] }, status: :not_found
    else
      @serialized_doctors.each do |doctor|
        @response << {
          id: doctor[:id],
          name: doctor[:attributes][:name],
          hospital: doctor[:attributes][:hospital],
          specialization: doctor[:attributes][:specialization],
          cost_per_consult: doctor[:attributes][:cost_per_consult],
          description: doctor[:attributes][:description],
          imageUrl: doctor[:attributes][:image_url]
        }
      end
      render json: { data: @response, message: ['All doctors loaded'] }, status: :ok
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    if @current_user.role == 'admin'
      @doctor = Doctor.new(doctor_params)

      if params[:doctor][:image].present?
        image_url = params[:doctor][:image]
        begin
          downloaded_image = URI.open(image_url)
          @doctor.image.attach(io: downloaded_image, filename: File.basename(downloaded_image), content_type: downloaded_image.content_type)
        rescue OpenURI::HTTPError, URI::InvalidURIError => e
          Rails.logger.error("Error downloading or attaching image: #{e.message}")
          render json: { error: 'unprocessable_entity', error_message: ["Error downloading or attaching image: #{e.message}"] }, status: :unprocessable_entity
          return
        end
      end

      if @doctor.save
        render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :created
      else
        Rails.logger.error("Error saving doctor: #{@doctor.errors.full_messages}")
        render json: { error: 'unprocessable_entity', error_message: @doctor.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'unauthorized', error_message: 'admin permission required' }, status: :unauthorized
    end
  end

  def destroy
    if @current_user.role == 'admin'
      @doctor = Doctor.find(params[:id])
      @doctor.destroy
      render json: { message: 'Doctor deleted successfully' }, status: :ok
    else
      render json: { error: 'unauthorized', error_message: 'admin permission required' }, status: :unauthorized
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :hospital, :description, :cost_per_consult, :image)
  end
end
