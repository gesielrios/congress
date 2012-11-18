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

  def update
    @paper_submission = PaperSubmission.find(params[:id])

    respond_to do |format|
      if @paper_submission.update_attributes(params[:paper_submission])
        PaperSubmissionMailer.send_accept_paper_submission(@paper_submission).deliver if @paper_submission.status and @paper_submission.status.description == "Aceito"
        format.html { redirect_to admin_paper_submissions_path, notice: 'Submissao atualizada com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  #def destroy
    #@paper_submission = PaperSubmission.find(params[:id])
    #@paper_submission.destroy

    #respond_to do |format|
     # format.html { redirect_to admin_paper_submissions_path, notice: 'Submissao apagada com sucesso.' }
    #end
  #end
  
end