class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if user = User.authenticate(@session.email, @session.password)
      session[:user_id] = user.id
      flash[:notice] = "Bienvenido #{user.name}"
      redirect_to root_path
    else
      flash[:alert] = "Los datos no coinciden."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:password, :email)
  end
end
