require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

#dashboard... an intro to Robot World
  get '/' do
    erb :dashboard
  end

#See all Robots
  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  #See form to make new robot
  get '/robots/new' do
    erb :new
  end

#See one robot
  get '/robots/:id' do
    @robot = Robot.find(params[:id])
    erb :show
  end


#submit the new robot
  post '/robots' do
    robot = Robot.new(params[:robot])
    robot.save
    redirect '/robots'
  end

#see form to edit robot
  get '/robots/:id/edit' do
    @robot = Robot.find(params[:id])
    erb :edit
  end

#submit the new robot info

  put '/robots/:id' do |id|
    Robot.update(id.to_i, params[:task])
    redirect "/robots/#{id}"
  end

#delete robot
  delete '/robots/:id' do |id|
    Robot.destroy(id.to_i)
    redirect '/robots'
  end
end
