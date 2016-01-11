require 'rubygems'
require 'bundler/setup'

require 'warden'
require 'pry'


Warden::Clients::Consumer.new '127.0.0.1', 'asnow'
