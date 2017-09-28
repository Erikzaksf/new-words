

class Word

  @@list = []
  attr_reader :new_word, :id
  attr_accessor :definitions


  def initialize(attributes)
    @new_word = attributes.fetch(:new_word)
    @definitions = [attributes.fetch(:definition)]
    @id = @@list.length + 1
  end

  def save
    @@list.push(self)
  end

  def self.find(word_id)
    @@list.each do |word|
      if word.id == word_id.to_i
        return word
      end
    end
  end

  def self.clear
    @@list = []
  end


  def self.all
    @@list
  end

end
