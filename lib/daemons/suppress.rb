#!/usr/bin/env ruby
require 'rubygems'
require 'daemons'

#config = Daemons::Rails::Config.new("suppress", File.dirname(__FILE__) + "/../../")
# You might want to change this
ENV["RAILS_ENV"] ||= "development"

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "config", "environment"))

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do

  # Replace this with your code
  Rails.logger.auto_flushing = true
  Rails.logger.info "This daemon is still running at #{Time.now}.\n"
  
  sleep 10
end
