require 'date'
require 'mongo'

class DocDb

  BASE = 'mongodb://replyr-db.documents.azure.com:10255/replyr?ssl=true'

  def initialize
    @client = Mongo::Client.new(
      BASE,
      user: 'replyr-db',
      password: Rails.application.credentials.docdb[:db_password])
  end

  def get_channel(name)
    response = @client[:replyr].find(
      :id => "channel:#{name}"
    )

    get_json(response)[0]
  end

  def create_message(channel, message)
    body = construct_message(message)

    @client[:replyr]
      .find(:id => "channel:#{channel}")
      .update_one("$push" => { :messages => body })
  end

  def get_json(response)
    response_json = response.to_json
    JSON.parse(response_json)
  end

  def construct_message(message)
    {
      "timestamp" => DateTime.now.strftime('%Q').to_i,
      "username" => message[:username],
      "text" => message[:text]
    }
  end

end
