namespace :question do
    task :ask => :environment do
        UsersController.new.ask
        sleep 30
        UsersController.new.ask
    end
end