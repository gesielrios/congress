class Admin::PaperSubmissionsController < Admin::AdminController
  # GET /paper_submissions
  # GET /paper_submissions.json
  def index
    @paper_submissions = PaperSubmission.paginate(:page => params[:page]).order('id')
  end

  # GET /paper_submissions/1/edit
  def edit
    @paper_submission = PaperSubmission.find(params[:id])
  end
  
  def show
    @paper_submission = PaperSubmission.find(params[:id])
  end


  # PUT /paper_submissions/1
  # PUT /paper_submissions/1.json
  def update
    @paper_submission = PaperSubmission.find(params[:id])

    respond_to do |format|
      if @paper_submission.update_attributes(params[:paper_submission])
        format.html { redirect_to admin_paper_submissions_path, notice: 'Submissao atualizada com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end