# How this app was made

    $ rails new translations
    $ cd translations

### edit Gemfile: add rspec-rails
    $ rails g rspec:install

## Phrase model
    $ rails g scaffold phrase text:string
    $ rake db:migrate
    $ rake spec

### remove helper spec (add later if we make helpers) and remove pending model spec
    $ rake spec
    28 examples, 0 failures

### create some seed data to play with, edit db/seeds.rb to contain phrases:

    phrases = Phrase.create(
      [ {text: "How are you?"},
        {text: "How are you doing?"},
        {text: "¿Cómo estás?"},
        {text: "¿Cómo está usted?"},
        {text: "¿Qué tal?"}
        ] )

in real life, I'd build the db:seed to be resilient to an existing database and require uniqueness on phrase, but that's not relevant to this experiment, so for now let's just drop this and add translations

    $ rake db:drop

## Translation model

rails g model translation phrase_id:integer translated_phrase_id:integer

### remove pending examples in the translation spec and write model example for related translations

    describe Phrase do
      let(:english_phrase) { Phrase.create( text:'How are you?' ) }
      let(:spanish_phrase) { Phrase.create( text:'¿Cómo estás?' )  }

      it "can have a translation" do
        english_phrase.translations.create(translated_phrase:spanish_phrase)
      end
    end

and set up the relations

    class Phrase < ActiveRecord::Base
      has_many :translations
    end

    class Translation < ActiveRecord::Base
      belongs_to :phrase
      belongs_to :translated_phrase, :class_name => "Phrase"
    end

specs pass again

    $ rake spec
    Finished in 6.57 seconds
    29 examples, 0 failures



select * from phrases where id = (select phrase_id from translations where translated_phrase_id = 2 union select translated_phrase_id from translations where phrase_id = 2)



SELECT phrase_id FROM "translations" WHERE "translations"."translated_phrase_id" = 2 UNION SELECT translated_phrase_id FROM "translations" WHERE "translations"."phrase_id" = 2

Phrase.where(:id => translations.project(:phrase_id).where(translations[:translated_phrase_id].eq(2)).union(translations.project(:translated_phrase_id).where(translations[:phrase_id].eq(2))))



