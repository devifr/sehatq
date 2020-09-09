class Api::ListController < ApiController
  before_action :no_authentication_required

  def index
    @user_books = UserBook.filter(params)
  end

  def doctors
    @doctors = Doctor.all
  end

  def hospitals
    @hospitals = Hospital.all
  end
end