every 5.minutes do
  rake "rss:update"
end

#Send email to the users NOT IMPLEMENTED YET
every 1.days do
  #runner "AnotherModel.prune_old_records"
end

