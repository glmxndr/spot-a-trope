class CreateTropes < ActiveRecord::Migration
  def self.up
    create_table :tropes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tropes
  end
end
