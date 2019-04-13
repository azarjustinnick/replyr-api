require 'mongo'

class ChatController < ApplicationController
  # client = Mongo::Client.new("mongodb://replyr-db.documents.azure.com:10255/replyr")

  before_action :cors

  # GET channel/:name

  def channel
    render json: {
      "name" => params[:name],
      "messages" => [
        {
          "username" => "adarr",
          "text" => "Message #1",
          "timestamp" => 1555196237
        },
        {
          "username" => "nvladimiroff",
          "text" => "Message #2",
          "timestamp" => 1555197237
        },
        {
          "username" => "jrenjilian",
          "text" => "Message #3",
          "timestamp" => 1555198237
        }
      ]
    }
  end

  # POST channel/:name/message

  def create_message
    render status: 201
  end

  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
