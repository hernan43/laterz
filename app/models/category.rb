class Category < ActiveRecord::Base
  belongs_to :user
  has_many :links
  
  before_save :set_count
  
  def set_count
    self.count = self.links.count
  end
end
