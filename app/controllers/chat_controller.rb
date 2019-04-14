require 'date'
require 'mongo'

class ChatController < ApplicationController

  @@client = Mongo::Client.new(
    "mongodb://replyr-db.documents.azure.com:10255/replyr?ssl=true",
    user: "replyr-db",
    password: Rails.application.credentials.docdb[:db_password])

  before_action :cors

  # GET channel/:name

  def channel
    results_json = @@client[:replyr].find(:id => "channel:#{params[:name]}").to_json
    results = JSON.parse(results_json)[0]
    render json: {
      "name" => params[:name],
      "messages" => results['messages']
    }
  end

  # POST channel/:name/message

  def create_message
    body = {
      "timestamp" => DateTime.now.strftime('%Q').to_i,
      "username" => params[:chat][:username],
      "text" => params[:chat][:text]
    }

    @@client[:replyr]
      .find(:id => "channel:#{params[:name]}")
      .update_one("$push" => { :messages => body })

    render status: 201
  end

  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
