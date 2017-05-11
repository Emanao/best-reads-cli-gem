class BestReads::CLI

  def call
    BestReads::Scraper.scrape_best_of_lists
    start_menu
  end

  def start_menu
    puts "Welcome to Best Reads!"

    #First menu loop: lists_menu
    loop do
      puts "Please choose one of our Best-Of Lists"
      self.display_lists
      puts "Please enter a number between 1 and #{BestReads::List.all.size} or exit to quit".colorize(:color => :red)
      list_number = gets.strip.downcase
      if(list_number.to_i.between?(1, BestReads::List.all.size))
        list_url = BestReads::List.find_by_index(list_number.to_i).url
        #Second menu loop: books_menu
        BestReads::Scraper.scrape_books_by_list(list_url.to_s)
        loop do
          self.display_books
          puts "Press 0 to return to the previous menu, exit to quit or any key to refresh your page".colorize(:color => :red)
          books_menu_input = gets.strip.downcase
          break if books_menu_input =="0"
          return if books_menu_input =="exit"
        end
       end
       break if list_number == "exit"
     end
   end

   def display_lists
     BestReads::List.all.each.with_index(1) do |list, index|
       puts "#{index}. #{list.name}"
     end
   end

   def display_books
     BestReads::Book.all.each.with_index(1) do |book, index|
       puts "#{index}. #{book.title} by #{book.author}"
       puts "rating: #{book.rating}"
     end
   end

end
