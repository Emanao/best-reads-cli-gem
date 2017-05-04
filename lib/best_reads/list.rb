class BestReads::List
  attr_accessor :name, :url, :books
  attr_reader :display
  @@all = []

  def initialize(name)
    @name = name
    self.class.all<<self
  end
  def display
  end
  def self.all
    @@all
  end
end
