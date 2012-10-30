class PaperSubmissionsController < ApplicationController
  # GET /paper_submissions
  # GET /paper_submissions.json
  def index
    @paper_submission = PaperSubmission.find_by_token(params[:token])
    
    respond_to do |format|
      if @paper_submission
        format.html
      else
        flash[:error] = "Resumo nao cadastrado ou invalido."
        format.html {redirect_to root_path}
      end
    end
  end

  # GET /paper_submissions/new
  # GET /paper_submissions/new.json
  def new
    @paper_submission = PaperSubmission.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /paper_submissions/1/edit
  def edit
    @paper_submission = PaperSubmission.find_by_token(params[:token])
    respond_to do |format|
      if @paper_submission
        format.html
      else
        flash[:error] = "Resumo nao cadastrado ou invalido."
        format.html {redirect_to root_path}
      end
    end
  end

  # POST /paper_submissions
  # POST /paper_submissions.json
  def create
    @paper_submission = PaperSubmission.new(params[:paper_submission])

    respond_to do |format|
      if @paper_submission.save
        PaperSubmissionMailer.send_confimation_paper_submission(@paper_submission).deliver 
        format.html { redirect_to root_path, notice: 'Submissao realizada com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /paper_submissions/1
  # PUT /paper_submissions/1.json
  def update
    @paper_submission = PaperSubmission.find(params[:id])

    respond_to do |format|
      if @paper_submission.update_attributes(params[:paper_submission])
        format.html { redirect_to root_path, notice: 'Submissao atualizada com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
