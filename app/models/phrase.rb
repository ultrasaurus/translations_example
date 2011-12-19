class Phrase < ActiveRecord::Base
  has_many :translations

  def self.translated_phrases(phrase)
    joins("join translations as t1 on t1.phrase_id = phrases.id").
    joins("join translations as t2 on t2.translated_phrase_id = phrases.id").
    where("t1.phrase_id = ?", phrase.id).
    where("t2.translated_phrase_id = ?", phrase.id)

  end

end
