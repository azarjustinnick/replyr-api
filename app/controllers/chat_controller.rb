require 'date'
require 'mongo'

class ChatController < ApplicationController

  before_action :cors

  # GET channel/:name

  def channel
    client = Mongo::Client.new(
      "mongodb://replyr-db.documents.azure.com:10255/replyr?ssl=true",
      user: "replyr-db",
      password: Rails.application.credentials.docdb[:db_password])

    results_json = client[:replyr].find(:id => "channel:#{params[:name]}").to_json
    results = JSON.parse(results_json)[0]
    render json: {
      "channel" => params[:name],
      "messages" => results['messages']
    }
  end

  # POST channel/:name/message

  def create_message
    body = {
      "channel" => params[:name],
      "timestamp" => DateTime.now.strftime('%Q').to_i,
      "username" => params[:chat][:username],
      "text" => params[:chat][:text]
    }

    client = Mongo::Client.new(
      "mongodb://replyr-db.documents.azure.com:10255/replyr?ssl=true",
      user: "replyr-db",
      password: Rails.application.credentials.docdb[:db_password])

    client[:replyr]
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
