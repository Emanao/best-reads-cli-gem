
class BestReads::Scraper
  BASE_PATH = "https://www.goodreads.com"
  def self.scrape_best_of_lists
    doc = Nokogiri::HTML(open("#{BASE_PATH}/list"))
    list_details = []
    lists = doc.css(".rightContainer .bigBoxContent").first.css("a.listTitle")
    lists.each do |list|
      list_details << {name: list.text, url: list["href"]}
    end
    list_details
  end

  def self.scrape_books_by_list(books_url)
    doc = Nokogiri::HTML(open("#{BASE_PATH}/#{books_url}"))
    book_details = []
    book_table = doc.css("#all_votes tr td[3]")
    book_table.each do |book_detail|
      title_and_url = book_detail.css("a.bookTitle")
      book_details << {title: title_and_url.css("span").text,
                        url: title_and_url.attr("href").text,
                        author: book_detail.css("a.authorName").text,
                        rating: book_detail.css("span.minirating").text}
    end
    book_details

  end
  # def self.book_description (book_url)
  #   doc = Nokogiri::HTML(open(book_url))
  #   book_description = doc.css(".leftContainer #description span").first.text
  # end

end
