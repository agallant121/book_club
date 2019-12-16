require 'rails_helper'

RSpec.describe "Visiting author show page" do
  it "I see an author's information and their books information" do
    book_1 = Book.create(title: "New Book", publication_year: "1988", pages: "250")
    author_1 = Author.create(name: "Billy Bob")
    author_1.books << book_1

    visit "/authors/#{author_1.id}"

    expect(page).to have_content(author_1.name)
    expect(page).to have_content(book_1.title)
  end

  it "can show the average number of pages of each author's books" do
    book_1 = Book.create(title: "First Book", publication_year: "1988", pages: "200")
    book_2 = Book.create(title: "Second Book", publication_year: "1988", pages: "400")
    author_1 = Author.create(name: "Billy Bob")
    author_1.books << book_1
    author_1.books << book_2

    visit "/authors/#{author_1.id}"

    expect(page).to have_content("300")
  end
end
