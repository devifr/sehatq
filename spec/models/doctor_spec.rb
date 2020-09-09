# spec/model/doctor_spec.rb

require 'rails_helper'

RSpec.describe Doctor, Type: :model do
  subject {
    described_class.new(name: 1,
                        specialist: 1,
                        phone: DateTime.now,
                        start_at: DateTime.now
                        )
  }
  it 'is valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without start_at' do
    subject.start_at = nil
    expect(subject).to_not be_valid
  end
end
