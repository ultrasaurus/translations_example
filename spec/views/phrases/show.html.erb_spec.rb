require 'spec_helper'

describe "phrases/show.html.erb" do
  before(:each) do
    @phrase = assign(:phrase, stub_model(Phrase,
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
  end
end
