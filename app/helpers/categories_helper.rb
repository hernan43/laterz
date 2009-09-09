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

module CategoriesHelper
  def generate_category_shortcut_link(category=nil)
    category_id_stub = ""
    alt_text = "save this"
    
    if category
      category_id_stub = "&amp;category_id=#{category.id}"
      alt_text = "save this to #{h(category.name)}"
    end
    link_text = image_tag("icons/disk.png", :alt => alt_text)
    
    "<a href=\"javascript:void(location.href='#{new_link_url}?return=true#{category_id_stub}&amp;url='+encodeURIComponent(location.href))\" onmouseover=\"window.status='';return true\" onclick=\"return false\">#{link_text}</a>"
  end
end
