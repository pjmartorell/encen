# List of environments and their heroku git remotes
ENVIRONMENTS = {
  :production => 'heroku'
}

namespace :heroku do
  desc "Deploy to production"
  task :deploy do
    current_branch = `git branch | grep ^* | awk '{ print $2 }'`.strip

    Rake::Task['deploy:before_deploy'].invoke(env, current_branch)
    Rake::Task['deploy:update_code'].invoke(env, current_branch)
    Rake::Task['deploy:after_deploy'].invoke(env, current_branch)
  end

  task :before_deploy, :env, :branch do |t, args|
    puts "Deploying #{args[:branch]} to #{args[:env]}"

    # Ensure the user wants to deploy a non-master branch to production
    if args[:env] == :production && args[:branch] != 'master'
      print "Are you sure you want to deploy '#{args[:branch]}' to production? (y/n) " and STDOUT.flush
      char = $stdin.getc
      if char != ?y && char != ?Y
        puts "Deploy aborted"
        exit
      end
    end
  end

  task :after_deploy, :env, :branch do |t, args|
    `heroku rake db:migrate --app #{args[:branch]}`
    `heroku rake interpret:update --app #{args[:branch]}`
    puts "Done rake interpret:update within #{args[:branch]} app."
    puts "Done rake db:migrate within #{args[:branch]} app."
    puts "Deployment Complete"
  end

  task :update_code, :env, :branch do |t, args|
    FileUtils.cd Rails.root do
      puts "Updating heroku with branch #{args[:branch]}"
      `git push heroku-#{args[:branch]} +#{args[:branch]}:master`
    end
  end
end
