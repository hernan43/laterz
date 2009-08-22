class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  named_scope :no_category, :conditions => ['category_id IS NULL']
  
  before_create :set_title
  before_create :set_favicon
  
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
  end
  
  protected
  
  # this can fail if nokogiri is built against an old version of libxml2
  def fetch_title_from_remote
    doc = Nokogiri::HTML(open(self.url))
    doc.search('title').first.content
  end
end
