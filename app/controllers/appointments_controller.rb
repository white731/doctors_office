class AppointmentsController < ApplicationController
  def index
    @physician = Physician.find(params[:physician_id])
    @appointments = @physician.appointments.all
    @patients = @physician.patients.all
    binding.pry
  end

  def show
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.find(params[:id])
    @patient = Patient.find(@appointment.patient_id)
  end

  def new
  end

  def edit
  end
end
