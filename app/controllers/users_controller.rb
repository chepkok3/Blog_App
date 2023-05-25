class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :index

  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out_and_redirect
    else
      find_user
    end
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end

  def find_user
    @user = User.find_by(id: params[:id])

    unless @user
      redirect_to users_path, alert: 'User not found'
    end
  end
end
