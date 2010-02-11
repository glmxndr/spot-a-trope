class CreateTocentries < ActiveRecord::Migration
  def self.up
    create_table :tocentries do |t|
      t.integer :opus_id
      t.string :name
      t.string :code
      t.boolean :starred

      t.timestamps
    end

    add_index :tocentries, :code, { :name => "tocentries_code_index", :unique => true }
    
  end

  def self.down
    drop_table :tocentries
  end
end
