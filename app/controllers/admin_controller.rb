class AdminController < ApplicationController
  before_action :authenticate_admin_user!

  private

  def authenticate_admin_user!
    unless current_admin_user
      redirect_to root_path, alert: 'Access denied.'
    end
end
end