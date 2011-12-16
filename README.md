# How this app was made

    $ rails new translations
    $ cd translations

### edit Gemfile: add rspec-rails
    $ rails g rspec:install
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

