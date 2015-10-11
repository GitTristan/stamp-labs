class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was successfully created"
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'Picture Added!'
    else
      render :edit
    end
  end



  private


  def user_params
    params.require(:user).permit(:avatar, :email, :password)
  end


end
