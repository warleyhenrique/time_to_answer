class AdminsBackoffice::SubjectsController < AdminsBackofficeController

    def index
        @subjects = Subject.all.page(params[:page])
    end

end
