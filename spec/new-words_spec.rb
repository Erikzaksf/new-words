
require 'rspec'
require 'words'

describe("Word") do
   describe("#new_word") do
     it("checks that new_word reader method returns new_word") do
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       expect(word1.new_word).to(eq("calico"))
     end
   end
   describe("#save") do
     it("checks that save method adds word to variable words") do
       @@list = []
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       word1.save
       expect(@@list).to(eq([word1]))
     end
   end
   describe("#definitions") do
     it("checks that definitions reader method returns definitions") do
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       expect(word1.definitions).to(eq(["a common house cat"]))
     end
   end

   describe("#definitions=") do
     it("checks that definitions writer method updates definitions") do
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       word1.definitions = ["a common house cat"]
       expect(word1.definitions).to(eq(["a common house cat"]))
     end
   end
   describe(".all") do
     it("checks that this method returns the list of all words") do
       @@list = []
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       word1.save
       word2 = Word.new({new_word: "doggo", definition: "a good boy" })
       word2.save
       expect(Word.all).to(eq([word1, word2]))
     end
   end
   describe(".find") do
     it("checks that find method returns correct word when given id") do
       Word.clear
       word1 = Word.new({new_word: "calico", definition: "a common house cat" })
       word1.save
       word2 = Word.new({new_word: "doggo", definition: "a good boy" })
       word2.save
       expect(Word.find(2)).to(eq(word2))
     end
   end
   describe(".clear") do
     it("checks that clear method clears the words variable") do
       @@list = ["a", "common", "house", "cat"]
       Word.clear
       expect(@@list).to(eq([]))
     end
   end

end
