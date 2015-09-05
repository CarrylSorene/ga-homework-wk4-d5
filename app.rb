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

#INDEX
get '/' do

  if params

  puts 'video has been added'
  puts params

  sql = "select * from tube_videos"

  @db.exec(sql)
  
  end
  
  erb :show
end

#ADD

get 'videos/add'

erb :add

#SHOW

post '/show' do

  sql = "insert into tube_videos () values ('#{}', '#{}')"

  @db.exec(sql)

  erb :show


#EDIT




#DELETE