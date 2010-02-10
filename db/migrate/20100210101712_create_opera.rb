class CreateOpera < ActiveRecord::Migration
  def self.up
    create_table :opera do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :opera
  end
end
