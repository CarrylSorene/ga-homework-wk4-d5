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
  redirect to '/videos'
end

#INDEX
get '/videos' do
  
  sql = "select * from tube_videos"

  @videos = @db.exec(sql)
  
  erb :videos
end

#NEW
get '/videos/new' do
  erb :new
end

#CREATE
post '/videos' do
  sql = "insert into tube_videos (title, url, genre, description) values ('#{params[:title]}', '#{params[:url]}', '#{params[:genre]}', '#{params[:description
    ]}')"

video = @db.exec(sql)

redirect to '/videos'
end

#SHOW

get '/videos/:id' do

  sql = "select * from tube_videos"
  video = @db.exec(sql)

  erb :show

end