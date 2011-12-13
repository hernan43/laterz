#
# This file is part of Laterz.
#
# Laterz is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Laterz is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Laterz.  If not, see <http://www.gnu.org/licenses/>.
#
#

class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :touch => true

  named_scope :no_category, :conditions => ['category_id IS NULL']

  before_create :set_title
  before_create :set_favicon
  before_save :strip_bad_categories
  after_create :update_category_count

  # just make sure urls are regular format
  # def validate
  #     begin
  #      uri = URI.parse(url)
  #      if uri.class != URI::HTTP and uri.class != URI::HTTPS
  #        errors.add(:url, 'Only HTTP(S) protocol addresses can be used')
  #      end
  #     rescue URI::InvalidURIError
  #      errors.add(:url, 'The format of the url is not valid.')
  #     end
  #   end

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
    # >> doc.xpath("/html/head/link[@rel='shortcut icon']")[0]['href']
    # => "http://a1.twimg.com/a/1250809294/images/favicon.ico"
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
