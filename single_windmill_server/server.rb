require 'sinatra'
require 'json'

# Import Windmill model
require_relative 'windmill'

# Configuration for web server
set :bind, '0.0.0.0'

# Create a windmill instance
windmill = Windmill.new

# Web routes
get '/' do
  send_file 'index.html'
end

post '/blade_num' do
  windmill.blade_num = params[:blade_num]
  redirect '/'
end

post '/blade_shape' do
  windmill.blade_shape = params[:blade_shape]
  redirect '/'
end

post '/height' do
  windmill.height = params[:height]
  redirect '/'
end

get '/windmill_status.json' do
  content_type :json
  {
    :blade_num => windmill.blade_num,
    :blade_shape => windmill.blade_shape,
    :height => windmill.height
  }.to_json
end
