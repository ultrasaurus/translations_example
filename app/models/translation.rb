class Translation < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :translated_phrase, :class_name => "Phrase"
end
