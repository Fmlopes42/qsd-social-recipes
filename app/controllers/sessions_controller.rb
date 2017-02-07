class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(mail: session_params[:mail].downcase)
    if authentic?
      session[:user_id] = @user.id
      flash[:notice] = "Bem-vindo(a) de volta, #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:notice] = 'E-mail ou senha inválido'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = 'Log out com sucesso!'
  end

  private

  def session_params
    params.require(:session).permit(:mail, :password)
  end

  def authentic?
    password = session_params[:password]
    @user && @user.authenticate(password)
  end
end
