class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if (@user = login params[:name], params[:password])
      redirect_back_or_to :users, notice: '로그인 성공'
    else
      flash.now[:alert] = '로그인 실패'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to :login, notice: '로그아웃!'
  end
end
