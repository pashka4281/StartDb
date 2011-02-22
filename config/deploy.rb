default_run_options[:pty] = true
set :use_sudo, false
# The name of your app
set :application, "startdb"
# The directory on the EC2 node that will be deployed to
set :deploy_to, "/var/www/#{application}"
#set :deploy_to, "/var/www/corpsite"
set :current_deploy_dir, "#{deploy_to}/current"
# The type of Source Code Management system you are using
set :scm, :git
# The location of the LOCAL repository relative to the current app
set :repository,  "."
# The way in which files will be transferred from repository to remote host
# If you were using a hosted github repository this would be slightly different
set :deploy_via, :copy

# The address of the remote host on EC2 (the Public DNS address)
set :location, "ec2-50-16-166-3.compute-1.amazonaws.com"
# setup some Capistrano roles
server "ec2-50-16-166-3.compute-1.amazonaws.com", :app, :web, :db, :primary => true

# Set up SSH so it can connect to the EC2 node - assumes your SSH key is in ~/.ssh/id_rsa
set :user, "git"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
#puts ssh_options[:keys]
