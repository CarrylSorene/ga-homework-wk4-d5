require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'

before do
  @db = PG.connect(dbname: 'tube_app', host: 'localhost')
end

after do
  @db.close
end

#HOME

get '/' do
  redirect to '/videos/'
end

#INDEX
get '/videos/' do
  
  sql = "select * from tube_videos"

  @videos = @db.exec(sql)

  erb :videos
end

#NEW
get '/videos/new' do
  erb :new

end

#CREATE
post '/videos/new' do

  sql = "insert into tube_videos (title, url, genre, description) values ('#{params[:title]}', '#{params[:url]}', '#{params[:genre]}', '#{params[:description]}') returning * "

  @videos = @db.exec(sql)

  erb :videos
end

#SHOW
get '/videos/:title' do

  sql = "select * from tube_videos where title LIKE '%#{params[:title]}%'"
  @videos = @db.exec(sql)

  erb :show
end