class Doctor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :start_at

end
