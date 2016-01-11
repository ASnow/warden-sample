require 'rubygems'
require 'bundler/setup'

require 'warden'
require 'pry'

require 'em-hiredis'


Warden::Clients::Publisher.new '127.0.0.1' do |conn|
  redis = EM::Hiredis.connect
  pubsub = redis.pubsub

  pubsub.psubscribe('user.*') do |channel, msg|
    conn.send_msg JSON.dump ["asnow", msg]
  end
end
