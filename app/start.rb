require 'io/console'
#require 'pry-byebug'
#require './application'
#app = Application.new

Signal.trap('TERM') { raise SystemExit } # catch docker stop signal
begin
  puts 'Use Ctrl-C to stop'
  while 1; sleep 10; end
rescue SystemExit, Interrupt
  puts 'Exiting...'
  #app.close 
  exit
rescue StandardError => e
  #NotifyException.new("docker-ruby-template", ENV["EXCEPTION_HOOK_URL"], e) if ENV["EXCEPTION_HOOK_URL"]
  raise
end