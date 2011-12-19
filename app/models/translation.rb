class Translation < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :translated_phrase, :class_name => "Phrase"

  def self.translated_phrases(phrase)
    where('phrase_id = ? or translated_phrase_id = ?',  phrase.id, phrase.id).
    joins("join phrases as p1 on translations.phrase_id =  p1.id").
    joins("join phrases as p2 on translations.translated_phrase_id = p2.id")

  end
  
end
