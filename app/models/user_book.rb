class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  scope :today, -> { where("DATE(booking_at) >= DATE(?) AND DATE(booking_at) <= DATE(?)", Time.now.beginning_of_day, Time.now.end_of_day) }

  scope :by_doctor, ->(doctor_id) {
    return where(nil) if doctor_id.blank?

    where('user_books.doctor_id = ?', doctor_id)
  }

  scope :by_patient, ->(patient_id) {
    return where(nil) if patient_id.blank?

    where('user_books.patient_id = ?', patient_id)
  }

  def self.filter( params={} )
    by_doctor( params[:doctor_id] )
      .by_patient( params[:patient_id] )
  end


end
