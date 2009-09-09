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

class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :favicon
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
