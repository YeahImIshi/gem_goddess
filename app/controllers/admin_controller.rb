class AdminController < ApplicationController
  before_action :authenticate_admin_user!

  private

  def authenticate_admin_user!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'Access denied.'
    else
      redirect_to admin_root_path
  end
end
end