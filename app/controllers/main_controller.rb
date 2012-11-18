class MainController < ApplicationController
  
  def posters
    @day = 23
    @paper_submissions = PaperSubmission.all
  end
  
end
