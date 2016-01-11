require 'rubygems'
require 'bundler/setup'

require 'em-hiredis'



EM.epoll
EM.run do
  redis = EM::Hiredis.connect
  pubsub = redis.pubsub

  EM.add_periodic_timer(1) {
    redis.publish("user.asnow", "hello").errback { |e|
      p [:publisherror, e]
    }
  }
end
