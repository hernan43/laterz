class AddCountToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :count, :integer
  end

  def self.down
    remove_column :categories, :count
  end
end
