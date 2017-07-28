class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  private
  def not_authenticated
    redirect_to login_path, alert: '로그인을 해주세요.'
  end
end
