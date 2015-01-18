require 'sinatra'
require 'haml'
require 'pg'
require 'uri'
require 'json'

class App < Sinatra::Base
  configure { set :server, :puma }

  # PostgreSQL connection
  conn_uri = URI.parse(ENV['WEBAPP_PORT'])
  conn = PG::Connection.open(
                             host: conn_uri.host,
                             port: conn_uri.port,
                             dbname: ENV['WEBAPP_ENV_DATABASE_NAME'],
                             user: ENV['WEBAPP_ENV_DATABASE_USER'],
                             password: ENV['WEBAPP_ENV_DATABASE_PASSWORD'])
  # Database setup
  conn.exec('CREATE TABLE IF NOT EXISTS books (
               isbn integer,
               PRIMARY KEY(isbn), title VARCHAR(32) )')

  get '/' do
    haml '%h1 Hello from Sinatra!'
  end

  get '/ding' do
    haml "%p Dong! It is #{Time.now}"
  end

  post '/books' do
    haml "%p Oups wrong parameters. We expect a title and an isbn number" if params[:title].nil? || params[:isbn].nil?
    conn.exec_params("INSERT INTO books (title, isbn) VALUES ('$1', '$2')", [params[:title], params[:isbn]])
    201
  end

  get '/books' do
    conn.exec('SELECT * FROM books').map(&:to_h).to_json
  end
end
