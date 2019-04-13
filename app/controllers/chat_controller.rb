require 'mongo'

class ChatController < ApplicationController
  # client = Mongo::Client.new('mongodb://replyr-db.documents.azure.com:10255')

  # GET channel

  def channel
    render json: { "name" => params[:name], "messages" => [] }
  end
  
end
