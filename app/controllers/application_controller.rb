class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_up_path_for(resource)
    home_index_path
  end

  private

  def authenticate_admin_user!

  end

  def current_admin_user

  end

end
