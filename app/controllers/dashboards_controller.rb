class DashboardsController < ProtectedController
  def show
    @appointments = current_user.patient_profile.appointments
  end
end
