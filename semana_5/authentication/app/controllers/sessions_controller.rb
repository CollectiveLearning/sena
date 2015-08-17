class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])

    if @session.valid? && login?
      flash[:notice] = "Hola"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    cookies.delete(:user_id)
    flash[:notice] = 'Chao'
    redirect_to root_path
  end

  private

  def login?
    @user = User.authenticate(@session.email, @session.password)
    if @user
      set_cookie
    else
      false
    end
  end

  def set_cookie
    cookies[:user_id] = @user.id
  end

end