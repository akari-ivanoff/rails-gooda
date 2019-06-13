class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
    @invitations = @user.invitations
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :bio, :photo)
  end

  def find_user
    @user = current_user
  end
end
