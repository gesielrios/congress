require 'spec_helper'

describe "paper_submissions/index" do
  before(:each) do
    assign(:paper_submissions, [
      stub_model(PaperSubmission,
        :name => "Name",
        :email => "Email",
        :title => "Title"
      ),
      stub_model(PaperSubmission,
        :name => "Name",
        :email => "Email",
        :title => "Title"
      )
    ])
  end

  it "renders a list of paper_submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
