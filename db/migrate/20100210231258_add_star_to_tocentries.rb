class AddStarToTocentries < ActiveRecord::Migration
  def self.up
    add_column :tocentries, :starred, :boolean
  end

  def self.down
    remove_column :tocentries, :starred
  end
end
