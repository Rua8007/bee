class SessionsController < ApplicationController
	skip_before_filter :require_login, except: [:destroy]
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users)
      flash.now[:success] = "Logged in success"

    else
      flash.now[:danger] = "Invalid Email / password combination"
      render  'new'
    end
  end

  def destroy
  	logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
