class AddCodeToEditions < ActiveRecord::Migration
  def self.up
    add_column :editions, :code, :string
  end

  def self.down
    remove_column :editions, :code
  end
end
