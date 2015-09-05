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

  # if params
  # puts 'video has been added'
  # puts params
  
  sql = "select * from tube_videos"

  @videos = @db.exec(sql)
  
  # end
  
  erb :index
end

#NEW

get 'videos/new' do
  erb :new
end

#CREATE

#SHOW

#EDIT

#DELETE