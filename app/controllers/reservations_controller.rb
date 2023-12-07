class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :update, :destroy]
    load_and_authorize_resource
  
    # Reserve Form
    def new
      @reservation = Reservation.new
      # Autofill username and selected doctor
      @reservation.username = current_user.username
      @reservation.doctor_id = params[:doctor_id] if params[:doctor_id]
    end
  
    def create
      @reservation = Reservation.new(reservation_params)
  
      if @reservation.save
        render json: @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  
    # My Reservations
    def index
      @reservations = Reservation.where(username: current_user.username)
      render json: @reservations
    end
  
    private
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  
    def reservation_params
      params.require(:reservation).permit(:date, :city, :doctor_id, :username)
    end
  end
  