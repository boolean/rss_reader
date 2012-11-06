set :application, "RssReader"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

set :deploy_to, "/var/www/#{application}"

# Add RVM's lib directory to the load path.
set :rvm_ruby_string, '1.9.3@rss_reader'

# Load RVM's capistrano plugin.
require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano-unicorn"

load "deploy/assets"

set :keep_releases, 2

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

default_run_options[:pty] = true

task :symlinks do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  sudo "chown -R www-data:www-data #{current_release}"
end

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy", "deploy:migrate"
before "deploy:assets:precompile", "symlinks"
before "deploy:restart", "unicorn:stop"
