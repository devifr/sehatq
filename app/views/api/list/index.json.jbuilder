json.schedules @user_books do |sch|
  json.id sch.id
  json.doctor sch.doctor.name
  json.patient sch.user.email
  json.booking_at sch.booking_at.localtime("+07:00").strftime('%d %B %Y %H:%M')
  json.created_at sch.user.created_at.localtime("+07:00").strftime('%d %B %Y %H:%M')
end
