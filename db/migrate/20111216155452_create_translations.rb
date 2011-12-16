class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :phrase_id
      t.integer :translated_phrase_id

      t.timestamps
    end
  end
end
