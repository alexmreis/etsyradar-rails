namespace :radar do
  desc 'Polls all radars for updates'
  task :poll => :environment do
    Radar.all.each do |radar|
      radar.poll
      sleep 1
    end
  end
end
