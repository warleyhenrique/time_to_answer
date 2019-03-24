class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @count_admins = Admin.all.count
    @count_users = User.all.count
    @count_subjects = Subject.all.count
  end
end
