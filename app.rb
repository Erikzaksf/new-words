require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')
require('pry')





get('/') do
  @list = Word.all()
  erb(:output)
end

post('/') do
  words = params["words"]
  definition = params["definition"].to_i
  word = Word.new(words, definition)
  word.save()
  @list = Word.all()


  erb(:output)
end

get('/word/:id') do
  @words = Word.find(params[:id])
  erb(:word)
end
