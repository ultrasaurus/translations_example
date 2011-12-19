# encoding: UTF-8
require 'spec_helper'

describe Phrase do
  let(:english_phrase) { Phrase.create( text:'How are you?' ) }
  let(:spanish_phrase) { Phrase.create( text:'¿Cómo estás?' )  }

  describe "translation" do
    before do
      english_phrase.translations.create(translated_phrase:spanish_phrase)
    end
    it "can be found from original phrase" do
      Phrase.translated_phrases(english_phrase).should == [spanish_phrase]
    end

    it "can be found from translated phrase" do
      Phrase.translated_phrases(spanish_phrase).should == [english_phrase]
    end
  end
end
