require 'pusher'

Pusher.app_id = '439966'
Pusher.key = 'a1170bd123cf449a6860'
Pusher.secret = '9e0f92410b41fcf46509'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb
class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('my-channel', 'my-event', {
      message: 'hello world'
    })
  end
end
