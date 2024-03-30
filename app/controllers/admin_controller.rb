class AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end