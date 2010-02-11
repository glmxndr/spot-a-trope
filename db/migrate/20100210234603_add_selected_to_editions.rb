class AddSelectedToEditions < ActiveRecord::Migration
  def self.up
    add_column :editions, :selected, :boolean
  end

  def self.down
    remove_column :editions, :selected
  end
end
