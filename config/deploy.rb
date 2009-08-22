set :application, "laterz"
# i think this is how it goes based on
# http://github.com/guides/deploying-with-capistrano
set :repository,  "git@github.com:railsrumble/rr09-team-162.git"

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