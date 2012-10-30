require 'spec_helper'

describe "paper_submissions/show" do
  before(:each) do
    @paper_submission = assign(:paper_submission, stub_model(PaperSubmission,
      :name => "Name",
      :email => "Email",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Title/)
  end
end
