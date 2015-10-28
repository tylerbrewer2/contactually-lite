class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user.save
      contact_file = params[:user][:contact_file].read.split("\n")
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
