class UsersController < ApplicationController

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
    params.require(:user).permit(:avatar)
  end


end
