class AdminsBackoffice::UsersController < AdminsBackofficeController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank?
      params[:user].extract!(:password, :password_confirmation)
    end

    @user = User.find(params[:id])
    params_user = params.require(:user).permit(:email, :password, :password_confirmation)

    if @user.update(params_user)
      redirect_to admins_backoffice_users_path, notice:"Usuario atualizado com sucesso"
    else
      render :edit
    end
  end
end

