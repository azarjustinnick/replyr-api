require 'mongo'

class ChatController < ApplicationController
  # client = Mongo::Client.new('mongodb://replyr-db.documents.azure.com:10255')

  # GET channel/:name

  def channel
    render json: {
      "name" => params[:name],
      "messages" => [
        {
          "username" => "adarr",
          "text" => "Message #1",
          "timestamp" => "2019-04-13T23:01:43.025Z"
        },
        {
          "username" => "nvladimiroff",
          "text" => "Message #2",
          "timestamp" => "2019-04-13T23:02:43.025Z"
        },
        {
          "username" => "jrenjilian",
          "text" => "Message #3",
          "timestamp" => "2019-04-13T23:03:43.025Z"
        }
      ]
    }
  end

  # POST channel/:name/message

  def create_message
    render status: 201
  end

end
