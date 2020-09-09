# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "start #{Time.now}"
size = (1..10).to_a
# Create Doctor
puts "start create doctors"
doctors = []
size.each do |i|
  doctor = Doctor.find_or_create_by({ name: "Doctor-#{i}", specialist: "Specialist Doctor - #{i}", phone: "0898827398#{i}", start_at: Time.now, finish_at: (Time.now + 8.hours) })
  doctors << doctor
end
puts "finish create #{doctors.size} doctors"

# Create Hospital
puts "start create hospitals"
hospitals = []
size.each do |i|
  hospital = Hospital.find_or_create_by({ name: "Hospital-#{i}", phone: "082387163287#{i}", address: "Jalan Sehatq No.#{i}" })
  hospitals << hospital
end
puts "finish create #{hospitals.size} hospitals"

# Create User
puts "start create users"
users = []
size.each do |i|
  user = User.find_or_initialize_by(email: "name-#{i}@email.com")
  user.password = "password-#{i}"
  user.save
  users << user
end
puts "finish create #{users.size} users"


puts "end #{Time.now}"
