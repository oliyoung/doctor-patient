class ProtectedController < ApplicationController
  before_action :require_login
  helper_method :profile

  private

  def profile
    current_user.patient_profile
  end
end
