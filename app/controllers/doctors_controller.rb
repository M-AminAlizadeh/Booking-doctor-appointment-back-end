class DoctorsController < ApplicationController
    before_action :set_doctor, only: [:show, :update, :destroy]
    load_and_authorize_resource
  
    # List of Doctors
    def index
      @doctors = Doctor.all
      render json: @doctors
    end
  
    # Details Page
    def show
      render json: @doctor
    end
  
    # Add Doctor Form
    def new
      @doctor = Doctor.new
    end
  
    def create
      @doctor = Doctor.new(doctor_params)
  
      if @doctor.save
        render json: @doctor, status: :created
      else
        render json: @doctor.errors, status: :unprocessable_entity
      end
    end
  
    # Delete Doctor
    def destroy
      @doctor.destroy
      head :no_content
    end
  
    private
  
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end
  
    def doctor_params
      params.require(:doctor).permit(:name, :specialization, :hospital, :description, :cost_per_consult)
    end
  end
  