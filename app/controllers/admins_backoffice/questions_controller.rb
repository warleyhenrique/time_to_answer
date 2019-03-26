class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :set_question, only: [:edit, :update, :destroy]
    before_action :get_subjects, only: [:edit, :new]
  
    def index
        @questions = Question.includes(:subject)
                             .order(:description)
                             .page(params[:page])
    end
  
    def edit
    end
  
    def new
      @question = Question.new
    end
  
    def update
      if @question.update(params_question)
        redirect_to admins_backoffice_questions_path, notice:"Assunto atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def create
      @question = Question.new(params_question)
      if @question.save
        redirect_to admins_backoffice_questions_path, notice:"Novo Assunto cadastrado com sucesso!"
      else
        render :new
      end
    end
  
    def destroy
      if @question.destroy
        redirect_to admins_backoffice_questions_path, notice:"Assunto excluido com sucesso!"
      else
        render :index
      end
    end
  
    private
  
    def set_question
      @question = Question.find(params[:id])
    end
  
    def params_question
      params_question = params.require(:question).permit(:description, :subject_id)
    end

    def get_subjects
      @subjects = Subject.all
    end
end
