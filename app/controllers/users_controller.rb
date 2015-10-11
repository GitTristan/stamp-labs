class UsersController < ApplicationController

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "User was successfully created"
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      # GET https://bufferapp.com/oauth2/authorize?
      # client_id="1/b2043f218b85328de2e91378ba6b2a1f"&
      # redirect_uri="http://localhost:3000/"&
      # response_type=code

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
