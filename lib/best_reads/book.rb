class BestReads::Book
  attr_accessor :title, :author, :url, :rating
  attr_reader :display
  @@all=[]

  def self.create_and_display_from_collection(book_hash)
    book_hash.each_with_index do |book, index|
      new_book = self.new()
      book.each {|key, value| new_book.send(("#{key}="),value.strip)}
      new_book.save
      new_book.display_by_index(index)
    end
  end

  def display_by_index(index)
    puts "#{index+1}. #{self.title} by #{self.author}"
    puts "rating: #{self.rating}"
  end

  def save
    self.class.all<<self
  end

  def self.all
    @@all
  end

end
