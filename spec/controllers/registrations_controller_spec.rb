# spec/controllers/registrations_controller_spec.rb

require 'rails_helper'

RSpec.describe RegistrationsController, Type: :controller do
  subject {
    described_class.new(name: 'Hospital',
                        phone: DateTime.now,
                        address: 'Alamat'
                        )
  }
  describe "Sign Up"
  it 'is valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without phone' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
end
