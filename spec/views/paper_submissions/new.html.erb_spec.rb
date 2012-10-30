require 'spec_helper'

describe "paper_submissions/new" do
  before(:each) do
    assign(:paper_submission, stub_model(PaperSubmission,
      :name => "MyString",
      :email => "MyString",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new paper_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paper_submissions_path, :method => "post" do
      assert_select "input#paper_submission_name", :name => "paper_submission[name]"
      assert_select "input#paper_submission_email", :name => "paper_submission[email]"
      assert_select "input#paper_submission_title", :name => "paper_submission[title]"
    end
  end
end
