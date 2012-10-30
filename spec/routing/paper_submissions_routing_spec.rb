require "spec_helper"

describe PaperSubmissionsController do
  describe "routing" do

    it "routes to #index" do
      get("/paper_submissions").should route_to("paper_submissions#index")
    end

    it "routes to #new" do
      get("/paper_submissions/new").should route_to("paper_submissions#new")
    end

    it "routes to #show" do
      get("/paper_submissions/1").should route_to("paper_submissions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/paper_submissions/1/edit").should route_to("paper_submissions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/paper_submissions").should route_to("paper_submissions#create")
    end

    it "routes to #update" do
      put("/paper_submissions/1").should route_to("paper_submissions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/paper_submissions/1").should route_to("paper_submissions#destroy", :id => "1")
    end

  end
end
