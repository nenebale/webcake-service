task :ping_sites => :environment do
  websites = Website.all
  websites.each do |website|
    puts Service::Pinger.call(website.uri)
  end
end

task :wake_self do
  puts Service::Pinger.call('http://dev.webcake.ch')
end

task :stay_awake => [:ping_sites, :wake_self] do
  puts 'Finished!'
end