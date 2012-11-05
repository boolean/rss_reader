namespace :rss do
  desc "Update all the feeds"
  task :update => :environment do
    Channel.all.each do |channel|
      print '.'
      channel.update_feeds
    end

    puts ""

  end
end
