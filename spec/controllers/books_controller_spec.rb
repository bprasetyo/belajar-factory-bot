require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET #new' do

    it 'should be initialize data correctly' do
      get :new

      book = assigns(:book)
      expect(book).not_to be_nil
      expect(book.title).to be_blank
      expect(book.year).to eq Time.now.year
      expect(response).to render_template('new')
    end

  end

  describe 'POST #create' do

    it 'should not create book when title blank' do
      post :create, {
        params: {
          book: {
            title: '',
            year: 1990
          }
        }
      }

      book = assigns(:book)
      expect(book.new_record?).to eq true
      expect(book.id).to be_nil
      expect(book.year).to eq 1990
      expect(response).to render_template('new')
    end

    it 'should not create book when title blank' do
      post :create, {
        params: {
          book: {
            title: 'Title',
            year: 1990
          }
        }
      }

      book = assigns(:book)
      expect(book.new_record?).to eq false
      expect(book.id).not_to be_nil
      expect(book.title).to eq 'Title'
      expect(book.year).to eq 1990
      expect(response).to redirect_to book_path(book.id)
    end

  end

  describe "GET #show" do

    context 'ID is valid' do

      it 'should render correctly show page' do
        book = create(:book)

        get :show, {
          params: {
            id: book.id
          }
        }
        expect(response).to render_template('show')
      end

    end

  end

end