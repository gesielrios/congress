# APP SETTINGS
# 'env DEPLOY=NOME cap deploy' nome da variavel de ambiente
set :application, "Congress"

# GIT SETTINGS
set :scm,         :git
set :repository,  "https://github.com/gesielrios/congress.git"
set :branch,      "master"


# SSH SETTINGS
#set :user, "root"
set :copy_exclude, [ ".git/*" ]
set :deploy_via, :copy
set :shared_directory, "#{deploy_to}/shared"
set :use_sudo, false

namespace :uploader do
  task :symlink do
    run <<-CMD
      rm -rf  #{current_path}/public/images/system &&
      ln -nfs #{shared_path}/system #{release_path}/public/images/system
    CMD
  end

  task :create_dir do
    run "mkdir -p #{shared_path}/upload"
  end
end

after 'deploy:update_code' do
  uploader.symlink
  run "cd #{release_path} && bundle install --local --without=test development"
end

