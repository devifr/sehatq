class Api::SchedulesController < ApiController

  def index
    @user_books = UserBook.by_user(current_user.id)
  end

  def booking
    doctor_id = booking_params[:doctor_id]
    booking_at = booking_params[:booking_at]
    if can_booking?(doctor_id, booking_at)
      start_day_booking = booking_at.to_datetime.beginning_of_day
      end_day_booking = booking_at.to_datetime.end_of_day
      check_already_book = UserBook.where(user_id: current_user.id, doctor_id: doctor_id).where(booking_at: start_day_booking..end_day_booking)
      if check_already_book.blank?
        if maximum_time(doctor_id, booking_at)
          @error_message = 'You Cant Booking, Because More Than 30 minutes Before Doctor Start'
          render 'api/shared/error.json', status: :unprocessable_entity
        else
          @user_book = UserBook.new(user_id: current_user.id)
          @user_book.doctor_id  = booking_params[:doctor_id]
          @user_book.booking_at = booking_at
          @user_book.save
          render 'api/schedules/booking.json'
        end
      else
        time = check_already_book.first.booking_at.strftime('on %d %B %Y at %H:%M')
        @error_message = "You Already Booking On That Day at #{time}"
        render 'api/shared/error.json', status: :unprocessable_entity
      end
    else
      @error_message = 'This Doctor Has Limit On Booking That Day'
      render 'api/shared/error.json', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:book).permit(:doctor_id, :booking_at)
  end

  def can_booking?(doctor_id, booking_at)
    start_day_booking  = booking_at.to_datetime.beginning_of_day
    end_day_booking    = booking_at.to_datetime.end_of_day
    total_user_booking = UserBook.where(booking_at: start_day_booking..end_day_booking).where(doctor_id: doctor_id).count
    total_user_booking <= 10
  end

  def maximum_time(doctor_id, booking)
    doctor = Doctor.find(doctor_id)
    doctor.start_at.to_time.strftime("%H:%M") < (booking.to_time + 30.minutes).strftime("%H:%M")
  end
end
