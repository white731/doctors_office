class AppointmentsController < ApplicationController

  def index
    @physician = Physician.find(params[:physician_id])
    @appointments = @physician.appointments.all.sort_by { |a| a.appointment_date }
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

  ############### for the patient side ########################

  def patient_home
    @patient = Patient.find(params[:patient_id])
    @appointments = @patient.appointments.all.sort_by { |a| a.appointment_date }
  end

  def patient_show
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
    @physician = Physician.find(@appointment.physician.id)
  end
  
  def patient_new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new()
    @physicians = Physician.all
  end

  def patient_create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new(appointment_params)
    # @physician = Physician.find(@appointment.physician.id)
    
    if @appointment.save
      redirect_to patient_home_path(@patient)
    else
      render :patient_new
    end
  end

  def patient_edit
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:id])
    # @patient = Patient.find(@appointment.patient.id)
    @physicians = Physician.all
  end

  def patient_update
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:id])
    
    if @appointment.update(appointment_params)
      redirect_to show_patient_appointment_path(@patient, @appointment)
    else
      render :patient_edit
    end
  end

  def patient_destroy
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to patient_home_path(@patient)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date,:patient_id,:physician_id)
  end

end
