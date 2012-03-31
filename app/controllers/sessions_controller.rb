class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_index_path # TODO kullanıcı girince nere yönlendirilecek
    else
      flash[:error] = "Kullanici adin ve/veya parolan hatali"
      render "new"
    end
  end
  def destroy

  end
end
