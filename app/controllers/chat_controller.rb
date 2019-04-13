require 'mongo'

class ChatController < ApplicationController
  # client = Mongo::Client.new('mongodb://replyr-db.documents.azure.com:10255')

  # GET channel

  def channel
    render json: {
      "name" => params[:name],
      "messages" => [
        {
          "username" => "adarr",
          "text" => "Message #1",
          "timestamp" => "1555196237"
        },
        {
          "username" => "nvladimiroff",
          "text" => "Message #2",
          "timestamp" => "1555197237"
        },
        {
          "username" => "jrenjilian",
          "text" => "Message #3",
          "timestamp" => "1555198237"
        }
      ]
    }
  end

end
