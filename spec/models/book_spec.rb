require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do
    it {should have_many :book_authors}
    it {should have_many(:authors).through(:book_authors)}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :publication_year}
  end

  describe "methods" do
    it "can avergae page count for a collection of books" do
      book_1 = Book.create(title: "First Book", publication_year: "1988", pages: "200")
      book_2 = Book.create(title: "Second Book", publication_year: "1988", pages: "400")

      expect(Book.average_page_count).to eq(300)
    end
  end

end
