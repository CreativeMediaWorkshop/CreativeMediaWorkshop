rake db:migrate RAILS_ENV="production";
kill -s SIGUSR2 'cat /var/run/puma_cmw.pid';