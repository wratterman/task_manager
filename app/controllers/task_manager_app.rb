require_relative '../models/task.rb'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/easteregg' do
    "Don't expect anything cool"
  end

  get '/tasks' do
    @location = params[:location]
    @tasks = Task.all
    erb :index
  end


  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
  end

  get '/tasks/:id' do
    # require 'pry'; binding.pry
    @task = Task.find(params[:id])
    erb :show
  end
end
