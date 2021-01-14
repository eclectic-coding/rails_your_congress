desc "Just implements the rake routes task..."
task :routes => :environment do
  puts `rails routes`
end