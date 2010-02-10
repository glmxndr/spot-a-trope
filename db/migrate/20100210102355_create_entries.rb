class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :tocentry_id
      t.integer :edition_id
      t.text :content
      t.text :notes
      t.text :title

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
