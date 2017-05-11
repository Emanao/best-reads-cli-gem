class BestReads::Scraper
  BASE_PATH = "https://www.goodreads.com"

  def self.scrape_best_of_lists
    doc = Nokogiri::HTML(open("#{BASE_PATH}/list"))
    list_details = []
    lists = doc.css(".rightContainer .bigBoxContent").first.css("a.listTitle")
    BestReads::List.create_from_collection(lists.collect do |list|
       {name: list.text, url: list["href"]}
    end)
  end

  def self.scrape_books_by_list(books_url)
    doc = Nokogiri::HTML(open("#{BASE_PATH}/#{books_url}"))
    book_table = doc.css("#all_votes td:nth-child(3)")
    BestReads::Book.create_from_collection( book_table.collect do |book_detail|
      {title: book_detail.css("a.bookTitle").css("span").text,
      url: book_detail.css("a.bookTitle").attr("href").text,
      author: book_detail.css("a.authorName").text,
      rating: book_detail.css("span.minirating").text}
    end)
  end

end
