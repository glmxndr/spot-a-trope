class AddTreeBehaviourToTocentries < ActiveRecord::Migration
  def self.up
    add_column :tocentries, :parent_id, :integer
  end

  def self.down
    remove_column :tocentries, :parent_id
  end
end
