require 'date'
require 'mongo'

class ChatController < ApplicationController

  @@docdb = DocDb.new

  before_action :cors

  # GET channel/:name

  def channel
    results = @@docdb.get_channel(params[:name])

    render json: {
      'name' => params[:name],
      'messages' => results['messages'],
      'posts' => results['posts'] || []
    }
  end

  # POST channel/:name/message

  def create_message
    @@docdb.create_message(params[:name], params[:chat])

    render status: 201
  end

  # POST channel/:name/post

  def create_post
    @@docdb.create_post(params[:name], params[:chat])

    render status: 201
  end

  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
