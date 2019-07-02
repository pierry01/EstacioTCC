class Backoffice::UsersController < BackofficeController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!
  
  def index
    @users = User.all.page(params[:page])
  end
  
  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to backoffice_users_path, notice: 'Usuário criado!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(params_user)
      redirect_to backoffice_users_path, notice: 'Usuário atualizado!'
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to backoffice_users_path, notice: 'Usuário excluído!'
    else
      render :index
    end
  end
  
  private
  
  def params_user
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
