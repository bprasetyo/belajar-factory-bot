require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET #index' do

    it 'should render template index correctly' do
      get :index

      expect(response).to render_template('index')
    end
  end

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

    context 'invalid data' do

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

    end

    context 'valid data' do

      it 'should create book when fill all require fields' do
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
  end

  describe 'GET #edit' do

    it 'should render edit correctly' do
      book = create(:book)

      get :edit, {
        params: {
          id: book.id
        }
      }

      expect(response).to render_template('edit')
    end
  end

  describe 'PATCH #update' do

    context 'invalid data' do

      it 'should not update book when title blank' do
        book = create(:book)

        patch :update, {
          params: {
            id: book.id,
            book: {
              title: 'update title',
              year: ''
            }
          }
        }

        book.reload
        expect(book.title).not_to eq 'update title'
        expect(response).to render_template('edit')
      end

    end

    context 'valid data' do

      it 'should update book when title blank' do
        book = create(:book)

        patch :update, {
          params: {
            id: book.id,
            book: {
              title: 'Update Title',
              year: 2020
            }
          }
        }

        book.reload
        expect(book.title).to eq 'Update Title'
        expect(book.year).to eq 2020
        expect(response).to redirect_to book_path(book.id)
      end

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








