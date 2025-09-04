class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def index
  end

  def new
    redirect_to dashboard_path and return if Current.user
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to dashboard_path, notice: "Welcome! You have signed up successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
