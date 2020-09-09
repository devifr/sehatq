FactoryBot.define do

  factory :user_data, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8)  }
  end

  factory :doctor_data, class: User do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone  }
    start_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end

end
