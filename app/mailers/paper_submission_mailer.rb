class PaperSubmissionMailer < ActionMailer::Base
  default from: "congressofaesf@gmail.com", :content_type => "text/html"
  
  def send_confimation_paper_submission(paper_submission)
    @paper_submission = paper_submission
    mail(:to => paper_submission.email, :subject => "Confirmacao de submissao de resumo.")
  end
  
  
end
