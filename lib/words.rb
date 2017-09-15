require('pry')

class Word
  @@list = []
  attr_accessor :words, :definition

  def initialize(words, definition)
    @words = words
    @definition = definition
    @id = @@list.length + 1
  end

  def self.find(id)
    word_id = id.to_i()
    @@list.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

  def self.all()
    @@list.sort {|word1, word2| word1.definition <=> word2.definition}
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end
end
