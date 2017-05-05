class BestReads::List
  attr_accessor :name, :url, :books
  attr_reader :display
  @@all = []

  def initialize(list_hash)
    list_hash.each {|key, value| self.send(("#{key}="),value.strip)}
    self.class.all<<self
  end
  def display
  end
  def self.find_by_index(index)
    self.all[index.to_i-1]

  end
  def self.all
    @@all
  end

end
