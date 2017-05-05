class BestReads::CLI

  def call
    start_menu
  end

  def start_menu
    puts "Welcome to Best Reads!"

    #First menu loop: lists_menu
    loop do
      puts "Please choose one of our Best-Of Lists"
      #Scraping best of lists of books and initializing list objects
      best_of_lists = BestReads::Scraper.scrape_best_of_lists
      BestReads::List.create_and_display_from_collection(best_of_lists)
      puts "Please enter a number between 1 and #{best_of_lists.size} or exit to quit".colorize(:color => :red)
      list_number = gets.strip.downcase
      if(list_number.to_i.between?(1,best_of_lists.size))
        list_url = BestReads::List.find_by_index(list_number.to_i).url
        #Second menu loop: books_menu
        loop do
          best_of_books = BestReads::Scraper.scrape_books_by_list(list_url.to_s)
          BestReads::Book.create_and_display_from_collection(best_of_books)

          puts "Press 0 to return to the previous menu, exit to quit or any key to refresh your page".colorize(:color => :red)
          books_menu_input = gets.strip.downcase
          break if books_menu_input =="0"
          return if books_menu_input =="exit"
        end
       end
       break if list_number == "exit"
     end
   end
end
