class BestReads::List
  attr_accessor :name, :url, :books
  @@all = []

  def self.create_and_display_from_collection (list_hash)
    list_hash.each_with_index do |list, index|
      new_list = self.new()
      list.each {|key, value| new_list.send(("#{key}="),value.strip)}
      new_list.save
      new_list.display_by_index(index)
    end
    self.all
  end

  def display_by_index(index)
    puts "#{index+1}. #{self.name}"
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
