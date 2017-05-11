class BestReads::List
  attr_accessor :name, :url
  @@all = []

  def self.create_from_collection (list_hash)
    list_hash.each do |list|
      new_list = self.new()
      list.each {|key, value| new_list.send(("#{key}="),value.strip)}
      new_list.save
    end
    self.all
  end

  def save
    self.class.all<<self
  end

  def self.find_by_index(index)
    self.all[index.to_i-1]
  end

  def self.all
    @@all
  end

end
