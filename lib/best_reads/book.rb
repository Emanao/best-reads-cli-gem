class BestReads::Book
  attr_accessor :title, :author, :url, :rating
  attr_reader :display
  @@all=[]
  def initialize (book_hash)
    book_hash.each {|key, value| self.send(("#{key}="),value.strip)}
    self.class.all<<self
  end
  def self.all
    @@all
  end

end
