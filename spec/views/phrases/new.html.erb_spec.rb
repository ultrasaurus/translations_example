require 'spec_helper'

describe "phrases/new.html.erb" do
  before(:each) do
    assign(:phrase, stub_model(Phrase,
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new phrase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phrases_path, :method => "post" do
      assert_select "input#phrase_text", :name => "phrase[text]"
    end
  end
end
