require 'sinatra'
require 'haml'
require 'pg'

class App < Sinatra::Base
  configure { set :server, :puma }
  conn = PG::Connection.open(dbname: ENV['WEBAPP_DATABASE_NAME'], user: ENV['WEBAPP_DATABASE_USERNAME'], password: ENV['WEBAPP_DATABASE_PASSWORD'])
  conn.exec('CREATE TABLE IF NOT EXISTS books (
               PID INT NOT NULL AUTO_INCREMENT,
               PRIMARY KEY(PID), title VARCHAR(32),
               isbn INT(13) )')

  get '/' do
    haml '%h1 Hello from Sinatra!'
  end

  get '/ding' do
    haml "%p Dong! It is #{Time.now}"
  end

  post '/books' do
    conn.exec_params("INSERT INTO books (title, isbn) VALUES ('$1', '$2')", [params[:title], params[:isbn]])
  end

  get '/books' do
    conn.exec('SELECT * FROM books')
  end
end
