class AppointmentsController < ProtectedController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @appointment = current_user.patient_profile.appointments.build safe_params
    if @appointment.save
      respond_to do |format|
        format.html { redirect_to appointments_path }
        format.turbo_stream
      end
    else
      render :new, status: 422
    end
  end

  def update
    if @appointment.update safe_params
      respond_to do |format|
        format.html { redirect_to appointments_path }
        format.turbo_stream
      end
    else
      render :edit, status: 304
    end
  end

  def destroy
    if @appointment.destroy
      respond_to do |format|
        format.html { redirect_to appointments_path }
        format.turbo_stream
      end
    else
      render :show, status: 304
    end
  end

  private

  def set_appointment
    @appointment = current_user.patient_profile.appointments.find(params[:id])
  end

  def safe_params
    params.require(:appointment).permit(:doctor_profile_id, :clinic, :purpose, :appointment_at)
  end
end
