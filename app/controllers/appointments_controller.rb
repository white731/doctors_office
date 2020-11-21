class AppointmentsController < ApplicationController

  def index
    @physician = Physician.find(params[:physician_id])
    @appointments = @physician.appointments.all
    @patients = @physician.patients.all
    
  end

  def show
    @physician = Physician.find(params[:physician_id])
    @appointment = Appointment.find(params[:id])
    # @patient = Patient.find(@appointment.patient_id)
    @patient = Patient.find(@appointment.patient.id)
  end

  def new
    @physician = Physician.find(params[:physician_id])
    @appointment = Appointment.new()
    @patients = Patient.all
    
  end

  def create
    # binding.pry
    # @patients = Patient.all
    @physician = Physician.find(params[:physician_id])
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_appointment_path(@physician,@appointment)
    else
      render :new
    end
  end


  def edit
    @physician = Physician.find(params[:physician_id])
    @appointment = Appointment.find(params[:id])
    # @patient = Patient.find(@appointment.patient.id)
    @patients = Patient.all
  end

  def update
    @physician = Physician.find(params[:physician_id])
    @appointment = Appointment.find(params[:id])
    
    if @appointment.update(appointment_params)
      redirect_to physician_appointment_path(@physician, @appointment)
    else
      render :edit
    end
  end

  def destroy
    @physician = Physician.find(params[:physician_id])
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to physician_path(@physician)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date,:patient_id,:physician_id)
  end

end
