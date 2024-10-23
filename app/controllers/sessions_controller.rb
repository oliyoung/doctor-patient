class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: email)

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: t(".notice")
    else
      deny_access
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t(".notice")
  end

  private

  def email
    @email ||= params.dig(:session, :email)
  end
end
