require 'spec_helper'

describe "phrases/index.html.erb" do
  before(:each) do
    assign(:phrases, [
      stub_model(Phrase,
        :text => "Text"
      ),
      stub_model(Phrase,
        :text => "Text"
      )
    ])
  end

  it "renders a list of phrases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
