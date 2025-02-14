# frozen_string_literal: true

require 'pry'
require 'simplecov'
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'google_maps_geocoder'
# silence output
RSpec.configure do |config|
  config.before do
    quiet_logger = Logger.new(IO::NULL)
    allow(Logger).to receive(:new).and_return(quiet_logger)
  end

  config.after do
    allow(Logger).to receive(:new).and_call_original
  end
end
