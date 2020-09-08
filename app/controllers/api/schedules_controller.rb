class Api::SchedulesController < ApiController
  before_action :authenticate_user!, only: :booking

  def index
    @user_books = UserBook.filter(params)
  end

  def booking
    doctor_id = booking_params[:doctor_id]
    if can_booking?(doctor_id)
      @user_book = UserBook.today.find_or_initialize_by(user_id: current_user.id)
      if @user_book.new_record?
        if maximum_time(doctor_id, booking_params[:booking_at])
          render json: {
            messages: "You Cant Booking, Because More Than 30 minutes Before Doctor Start",
              data: {}
            }, status: :unprocessable_entity
        else
          @user_book.doctor_id  = booking_params[:doctor_id]
          @user_book.booking_at = booking_params[:booking_at]
          @user_book.save
          render 'api/schedules/booking.json'
        end
      else
        time = @user_book.booking_at.strftime("on %d %B %Y at %H:%M")
        render json: {
        messages: "You Already Booking Today at #{time}",
          data: {}
        }, status: :unprocessable_entity
      end
    else
      render json: {
        messages: "This Doctor Has Limit On Booking Today",
          data: {}
        }, status: :unprocessable_entity
    end
  end

  private
    def booking_params
      params.require(:book).permit(:doctor_id, :booking_at)
    end

    def can_booking?(doctor_id)
      total_user_booking = UserBook.today.where(doctor_id: doctor_id).count
      total_user_booking < 10
    end

    def maximum_time(doctor_id, booking)
      doctor = Doctor.find(doctor_id)
      doctor.start_at < (booking.to_time + 30.minutes)
    end
end