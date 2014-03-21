require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '0 11 * * *'  do
   MoItem.daily_refresh
end

scheduler.cron '0 0 * * 1' do
   MoItem.weekly_refresh
end
