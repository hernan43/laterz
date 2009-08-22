class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :touch => true
  
  named_scope :no_category, :conditions => ['category_id IS NULL']
  
  before_create :set_title
  before_create :set_favicon
  before_save :strip_bad_categories
  after_create :update_category_count
  
  # this is for printing
  def get_title
    self.title || self.url
  end
  
  def set_title
    begin
      self.title = fetch_title_from_remote
    rescue
      self.title = nil
    end
  end
  
  def set_favicon
    # this will set the favicon at some point
  end
  
  def strip_bad_categories
    if self.category_id and not self.user.category_ids.include? self.category_id
      self.category_id = nil
    end 
  end
  
  def update_category_count
    if self.category
      self.category.save
    end
  end
  
  protected
  
  # this can fail if nokogiri is built against an old version of libxml2
  def fetch_title_from_remote
    doc = Nokogiri::HTML(open(self.url))
    doc.search('title').first.content
  end
end
