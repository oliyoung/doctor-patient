class ProtectedController < ApplicationController
  before_action :require_login
end
