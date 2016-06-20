require './config/environment'
require 'haml'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "bigsecret"
  end

  get "/" do
    haml :index
  end

end
