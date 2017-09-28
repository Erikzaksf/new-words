require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')


get('/') do

  @list = Word.all
  erb(:word)
end

post('/') do
  new_word = params["new_word"]
  definition = params["definition"]
  Word.new({new_word: new_word, definition: definition}).save
  @list = Word.all
  erb(:word)
end

post('/clear') do
  Word.clear

  @list = Word.all
  erb(:word)
end

get('/word_meanings/:id') do
  @word = Word.find(params[:id])
  erb(:word_meanings)
end

post('/word_meanings/:id') do
  definition = params["definition"]
  @word = Word.find(params[:id])
  @word.definitions = @word.definitions.push(definition)
  erb(:word_meanings)
end
