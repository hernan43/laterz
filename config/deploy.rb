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

set :application, "laterz"
# i think this is how it goes based on
# http://github.com/guides/deploying-with-capistrano
set :repository,  "git@github.com:railsrumble/rr09-team-162.git"
set :branch, "railsrumble09"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/rails/#{application}"
set :deploy_via, :remote_cache

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, "git"
set :scm_verbose, true

role :app, "laterz.r09.railsrumble.com"
role :web, "laterz.r09.railsrumble.com"
role :db,  "laterz.r09.railsrumble.com", :primary => true

namespace :db do
  desc "Link database"
  task :symlink do
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :deploy do
  desc "Override deploy:cold to NOT run migrations"
  task :cold do
    update
    start
  end

  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

# make sure to link my db
after "deploy:update_code", "db:symlink"
