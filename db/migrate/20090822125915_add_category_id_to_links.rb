class AddCategoryIdToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :category_id, :integer
    add_index :links, :category_id
  end

  def self.down
    remove_index :links, :category_id
    remove_column :links, :category_id
  end
end
