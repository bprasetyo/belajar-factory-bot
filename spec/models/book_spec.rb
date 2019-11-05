require 'rails_helper'

RSpec.describe Book, type: :model do

  it 'create book manually' do
    book = Book.new
    book.title = 'Book'
    book.author = 'Author'
    book.type = 'Type'
    book.year = Time.now.year
    book.save

    expect(book.persisted?).to eq true
  end

  it 'create book using factory bot' do
    book = FactoryBot.create(:book)
    expect(book.persisted?).to eq true
  end

  it 'create book using factory bot without FactoryBot class' do
    book = create(:book)
    expect(book.persisted?).to eq true
  end

  it 'build vs create vs build_stubbed' do

    book1 = build(:book)
    expect(book1.persisted?).to eq false

    book2 = create(:book)
    expect(book2.persisted?).to eq true

    book3 = build_stubbed(:book)
    expect(book3.persisted?).to eq true

  end

  it 'performance build vs create vs build_stubbed' do

    ts1 = Benchmark.measure do
      i = 0
      while i < 1000 do
        build(:book)
        i += 1
      end
    end

    ts2 = Benchmark.measure do
      i = 0
      while i < 1000 do
        create(:book)
        i += 1
      end
    end

    ts3 = Benchmark.measure do
      i = 0
      while i < 1000 do
        build_stubbed(:book)
        i += 1
      end
    end

    puts '\n'
    puts ts1
    puts ts2
    puts ts3

    expect(ts1.real < ts2.real).to eq true
    expect(ts3.real < ts2.real).to eq true
  end

end
