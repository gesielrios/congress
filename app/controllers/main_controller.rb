class MainController < ApplicationController
  
  def posters
    @day = 21
    @paper_submissions = PaperSubmission.accepts
  end
  
end
