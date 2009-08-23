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
