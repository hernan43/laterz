class AddNotesToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :notes, :text
  end

  def self.down
    remove_column :links, :notes
  end
end
