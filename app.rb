require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require 'json'
require './environments'

Dir['./models/*.rb'].each { |f| require f }

class Application < Sinatra::Base
  post '/' do
    opt_in = OptIn.create(params.merge(active: true))
    status(opt_in.valid? ? 200 : 400)
    {id: opt_in.id}.to_json
  end

  put '/' do
    saved = OptIn.find(params["id"]).update_attributes(params)
    status(saved ? 200 : 400)
  end

  delete '/:id' do
    OptIn.find(params[:id]).deactivate
    status(200)
  end

  # Dictionaries

  get '/companies' do
    Company.all.to_json
  end

  get '/channels' do
    Channel.all.to_json
  end

  get '/permission_types' do
    PermissionType.all.to_json
  end

  # In all cases if record not found we need to response with 404
  def route_eval
    super
  rescue ActiveRecord::RecordNotFound
    not_found
  end
end
