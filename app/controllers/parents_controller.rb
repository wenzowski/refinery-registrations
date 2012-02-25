class ParentsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      redirect_back_or_default(session[:user_return_to] || registration_url)
    else
      render action: 'new'
    end
  end

  # TODO: let users update their accounts
  # def index
  # end
  # def edit
  # end
  # def update
  # end
  # def destroy
  # end

end