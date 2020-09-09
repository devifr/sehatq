class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :booking_at

  scope :by_doctor, ->(doctor_id) {
    return where(nil) if doctor_id.blank?

    where('user_books.doctor_id = ?', doctor_id)
  }

  scope :by_user, ->(user_id) {
    return where(nil) if user_id.blank?

    where('user_books.user_id = ?', user_id)
  }

  def self.filter( params={} )
    by_doctor( params[:doctor_id] )
      .by_user( params[:patient_id] )
  end


end
