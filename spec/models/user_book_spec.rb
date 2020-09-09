# spec/model/user_book_spec.rb

require 'rails_helper'

RSpec.describe UserBook, Type: :model do
  subject {
    described_class.new(user_id: 1,
                        doctor_id: 1,
                        booking_at: DateTime.now,
                        )
  }
  it 'is valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without doctor_id' do
    user_book = UserBook.new(doctor_id: nil)
    expect(user_book).to_not be_valid
  end
  it 'is not valid without user_id' do
  user_book = UserBook.new(user_id: nil)
  expect(user_book).to_not be_valid
end
  it 'is not valid without booking_at' do
    user_book = UserBook.new(booking_at: nil)
    expect(user_book).to_not be_valid
  end
end
