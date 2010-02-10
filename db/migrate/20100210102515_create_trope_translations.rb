class CreateTropeTranslations < ActiveRecord::Migration
  def self.up
    create_table :trope_translations do |t|
      t.integer :language_id
      t.string :title
      t.text :description
      t.integer :trope_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trope_translations
  end
end
