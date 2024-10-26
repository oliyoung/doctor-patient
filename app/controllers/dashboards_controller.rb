class DashboardsController < ProtectedController
  def show
    @appointments = current_user.patient_profile.appointments
    @notes = []
  end
end
