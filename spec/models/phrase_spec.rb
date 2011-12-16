# encoding: UTF-8
require 'spec_helper'

describe Phrase do
  let(:english_phrase) { Phrase.create( text:'How are you?' ) }
  let(:spanish_phrase) { Phrase.create( text:'¿Cómo estás?' )  }

  it "can have a translation" do
    english_phrase.translations.create(translated_phrase:spanish_phrase)
  end
end
