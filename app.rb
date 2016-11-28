require 'sinatra/base'
require 'json'

class KeyValueApp < Sinatra::Base

  enable :sessions
  set :port, 4000
  set :session_secret, 'super secret'

  get '/' do
    'hello!'
  end

  get '/set' do
    session[:data] = params.to_json
  end

  get '/get' do
    hash = JSON.parse(session[:data])
    return hash[params[:key]]
  end

  run! if app_file == $0
end
