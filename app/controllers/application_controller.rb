class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_up_path_for(resource)
    home_index_path
  end

  private

  def authenticate_admin_user!
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def current_admin_user
    current_user if current_user&.admin?
  end

end
