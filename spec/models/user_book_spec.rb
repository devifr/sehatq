# spec/model/user_book_spec.rb

require 'rails_helper'

RSpec.describe UserBook, Type: :model do

  context 'associations' do
    it "should belongs to user" do
     subject { described_class.new }
     assc = described_class.reflect_on_association(:user)
     expect(assc.macro).to eq :belongs_to
   end

    it "should belongs to doctor" do
     subject { described_class.new }
     assc = described_class.reflect_on_association(:doctor)
     expect(assc.macro).to eq :belongs_to
   end
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
