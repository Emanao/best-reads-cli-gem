require "pry"
class BestReads::Book
  attr_accessor :title, :author, :url, :rating
  @@all=[]

  def self.create_from_collection(book_hash)
    self.clear
    book_hash.each do |book|
      new_book = self.new()
      book.each {|key, value| new_book.send(("#{key}="),value.strip)}
      new_book.save
    end
  end

  def save
      self.class.all<<self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
