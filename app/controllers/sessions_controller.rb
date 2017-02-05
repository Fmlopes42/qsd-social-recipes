class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:notice]= "Bem-vindo, #{@user}!"
    else
      flash.now[:notice] = "E-mail ou senha inválido"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "Log out com sucesso!"
  end

end
