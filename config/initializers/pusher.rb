# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '439927'
Pusher.key = 'e8aa6e941d7a2e0773b2'
Pusher.secret = '1a7f79ea6568458a1c3e'
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
