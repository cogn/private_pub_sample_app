#!/usr/bin/env ruby

require 'rubygems'
require 'dante'

ENV["RAILS_ENV"] ||= "development"

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "config", "environment"))

$running = true
Signal.trap("TERM") do 
  $running = false
end


@pid = '/tmp/dante.pid'
@log_path = '/tmp/dante.log'

case ARGV[0]
when 'start'
  Dante::Runner.new('gitdocs').execute(:daemonize => true, :pid_path => @pid, :log_path => @log_path) { 
    loop {
		Rails.logger.auto_flushing = true
  	Rails.logger.info "This daemon is still running at #{Time.now}.\n"
        
  
  sleep 10
  }
  }
when 'stop'
  Dante::Runner.new('gitdocs').execute(:kill => true, :pid_path => @pid)
when 'restart'
  Dante::Runner.new('gitdocs').execute(:daemonize => true, :restart => true, :pid_path => @pid) {   
    loop {
    puts "is it running?"
    sleep(10)
  }
  }
else
  puts "Enter valid params"
end

def fetch_suppressed_alerts

end
