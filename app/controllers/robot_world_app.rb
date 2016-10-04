require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    "Hello Robot World!!!"
  end

  get '/robots' do
    erb :index
  end
end
