class ProfilesController < ApplicationController
  before_action :set_user

  def show
    # render json: @user.to_json
  end

  def edit

  end

  def update

  end

  private
  def set_user
    @user = User.find_by(name: params[:name])
  end
end
