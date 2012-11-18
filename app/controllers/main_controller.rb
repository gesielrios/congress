class MainController < ApplicationController
  
  def posters
    @day = 21
    @paper_submissions = PaperSubmission.all
  end
  
end
