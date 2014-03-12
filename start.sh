rake db:migrate RAILS_ENV="production";
bundle exec puma -e production -d -b unix:///var/run/cmw.sock --pidfile /var/run/puma_cmw.pid;