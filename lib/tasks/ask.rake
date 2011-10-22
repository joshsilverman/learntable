namespace :question do
    task :ask => :environment do
        UsersController.new.ask
    end
end