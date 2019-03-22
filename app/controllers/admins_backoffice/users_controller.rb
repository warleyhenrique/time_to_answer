class AdminsBackoffice::UsersController < AdminsBackofficeController
  before_action :verify_params, only: [:update]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
    if @user.update(params_user)
      redirect_to admins_backoffice_users_path, notice:"#{@user.email} atualizado com sucesso!"
    else
      render :edit
    end
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to admins_backoffice_users_path, notice:"#{@user.email} cadastrado com sucesso!"
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      redirect_to admins_backoffice_users_path, notice:"#{@user.email} excluido com sucesso!"
    else
      render :edit
    end
  end

  private

    def verify_params
      if params[:user][:password].blank?
        params[:user].extract!(:password, :password_confirmation)
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def params_user
      params_user = params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

