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

# Be sure to restart your server when you modify this file.

# These settings change the behavior of Rails 2 apps and will be defaults
# for Rails 3. You can remove this initializer when Rails 3 is released.

if defined?(ActiveRecord)
  # Include Active Record class name as root for JSON serialized output.
  ActiveRecord::Base.include_root_in_json = true

  # Store the full class name (including module namespace) in STI type column.
  ActiveRecord::Base.store_full_sti_class = true
end

# Use ISO 8601 format for JSON serialized times and dates.
ActiveSupport.use_standard_json_time_format = true

# Don't escape HTML entities in JSON, leave that for the #json_escape helper.
# if you're including raw json in an HTML page.
ActiveSupport.escape_html_entities_in_json = false