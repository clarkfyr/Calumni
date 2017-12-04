require 'pusher'

Pusher.app_id = '439934'
Pusher.key = 'f44531a8bf307e396700'
Pusher.secret = '50e4ac464b9df7541b3a'
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
