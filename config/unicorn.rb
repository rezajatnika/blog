app_path = "/home/ligavoters/justatest.com/production/current"

worker_processes   1
preload_app        true
timeout            180
listen             '127.0.0.1:9022'
user               'ligavoters', 'ligavoters'
working_directory  app_path
pid                "#{app_path}/tmp/pids/unicorn.pid"
stderr_path        "log/unicorn.log"
stdout_path        "log/unicorn.log"

before_fork do |server, worker|
  ActiveRecord::Base.conection.disconnect!
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue
      Errno::ENOENT, Errno::ESRCH
      # ...
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
