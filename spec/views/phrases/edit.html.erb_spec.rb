require 'spec_helper'

describe "phrases/edit.html.erb" do
  before(:each) do
    @phrase = assign(:phrase, stub_model(Phrase,
      :text => "MyString"
    ))
  end

  it "renders the edit phrase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phrases_path(@phrase), :method => "post" do
      assert_select "input#phrase_text", :name => "phrase[text]"
    end
  end
end
