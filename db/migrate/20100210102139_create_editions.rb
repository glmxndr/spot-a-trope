class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.integer :language_id
      t.integer :opus_id
      t.string :title
      t.string :translator
      t.integer :year
      t.string :country
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :editions
  end
end
