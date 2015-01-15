require 'sinatra'
require 'haml'

class App < Sinatra::Base
  configure { set :server, :puma }
  get '/' do
    haml '%h1 Hello from Sinatra!'
  end
end
