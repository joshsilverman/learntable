set :environment, "development"
# set :environment, "production"

every 1.minute do
    rake "question:ask"
end
