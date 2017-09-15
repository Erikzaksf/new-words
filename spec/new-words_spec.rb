require('rspec')
require('words')

describe("Word") do
  before() do
    Word.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Word.new("tacos", "important")
      item.save()
      expect(Word.all()).to(eq([item, item]))
    end
  end

  # describe("#save") do
  #   it("not allow duplicate item in the array") do
  #     item = Word.new("tacos")
  #     item.save()
  #     item2 = Word.new("tacos")
  #     item2.save()
  #     expect(Word.all()).to(eq([item]))
  #   end
  # end

  describe(".clear") do
    it("clears all items from the list") do
      item = Word.new("tacos")
      item.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("Increments an id by 1 each time a new intem is added") do
      item  = Word.new("tacos")
      item.save()
      item2 = Word.new("pizza")
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      item = Word.new("tacos")
      item.save()
      item2 = Word.new("pizza")
      item2.save()
      expect(Word.find(1)).to(eq(item))
      expect(Word.find(2)).to(eq(item2))
    end
  end
end
