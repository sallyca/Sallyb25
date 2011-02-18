module KindleClippings

  class ClippingResult < Array
#
    def highlights
      filter_by_property(:type, :Highlight)
    end

    def notes
      filter_by_property(:type, :Note)
    end

    def bookmarks
      filter_by_property(:type, :Bookmark)
    end

    def by_author(author)
      filter_by_property(:author, author)
    end

    def by_book(book)
      filter_by_property(:book_title, book)
    end

    def book_list()
      self.sort_by { |annotation| annotation.send(:book_title) }
    end

    def parse_books()  
#      self.each{|a| books.push(a.send(:book_title))}.uniq
#      return books.uniq
      self.inject( {} ) do | hash, obj |
                        hash.merge({ obj.send(:book_title) => obj })
        end
    end

    private

    def filter_by_property(property, value)
      return self unless value
      self.select { |annotation| annotation.send(property).downcase == value.downcase }
    end

  end
end