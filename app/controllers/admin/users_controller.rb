class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new params[:user]

    if @user.save
      redirect_to admin_root_path, :notice => "Nou usuari creat"
    else
      flash[:alert] = "Error en crear l'usuari"
      render :action => :new
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      redirect_to admin_root_path, :notice => "Usuari actualitzatt"
    else
      flash[:alert] = "Error en modificar l'usuari"
      render :action => :new
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_root_path
  end
end
