class PaperSubmissionMailer < ActionMailer::Base
  default from: "congressofaesf@gmail.com", :content_type => "text/html"
  
  def send_confimation_paper_submission(paper_submission)
    @paper_submission = paper_submission
    mail(:to => @paper_submission.email, :subject => "Confirmacao de submissao de resumo.")
  end
  
  def send_accept_paper_submission(paper_submission)
    @paper_submission = paper_submission
    mail(:to => @paper_submission.email, :subject => "Resumo aceito nos Anais do VIII Congresso da FAESF.")
  end
  
end
