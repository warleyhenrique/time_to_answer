class AdminsBackoffice::UsersController < AdminsBackofficeController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
