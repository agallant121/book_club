require 'rails_helper'

RSpec.describe "Visiting book index page" do
  describe "I see many books" do
    it "should have each books information" do
      book_1 = Book.create(title: "New Book", publication_year: "1988", pages: "250")
      book_2 = Book.create(title: "Second Book", publication_year: "1980", pages: "300")

      visit "/books"

      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.publication_year)
      expect(page).to have_content(book_1.pages)

      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.publication_year)
      expect(page).to have_content(book_2.pages)
    end

    it "should show each books author" do
      book_1 = Book.create(title: "New Book", publication_year: "1988", pages: "250")
      book_2 = Book.create(title: "Second Book", publication_year: "1980", pages: "300")
      author_1 = Author.create(name: "Billy Bob")
      author_2 = Author.create(name: "Willie Bob")
      # book_author_1 = BookAuthor.create(author: author_1, book: book_1)
      book_1.authors << author_1
      book_2.authors << author_2

      visit "/books"

      expect(page).to have_content(author_1.name)
      expect(page).to have_content(author_2.name) # or book_2.authors[0].name
    end

      it "author's name should be a link" do
        book_1 = Book.create(title: "New Book", publication_year: "1988", pages: "250")
        author_1 = Author.create(name: "Billy Bob")
        book_1.authors << author_1

        visit "/books"

        expect(page).to have_link(author_1.name)

        click_link author_1.name

        expect(current_path).to eq("/authors/#{author_1.id}")
    end
  end
end
