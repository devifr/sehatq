class Api::ListController < ApiController
  before_action :authenticate_user!

  def doctors
    @doctors = Doctor.all
  end

  def hospitals
    @hospitals = Hospital.all
  end
end