# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "start #{Time.now}"
size = (1..10).to_a
# Create Doctor
size.each do |i|
  Doctor.find_or_create_by({ name: "Doctor-#{i}", specialist: "Specialist Doctor - #{i}", start_at: Time.now, finish_at: (Time.now + 8.hours) })
end

# Create Hospital
size.each do |i|
  Hospital.find_or_create_by({ name: "Hospital-#{i}", phone: "082387163287#{i}", address: "Jalan Sehatq No.#{i}" })
end

# Create User
size.each do |i|
  user = User.find_or_initialize_by(email: "name-#{i}@email.com")
  user.password = "password-#{i}"
  user.save
end



puts "end #{Time.now}"
