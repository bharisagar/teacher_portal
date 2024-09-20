class Teacher < ApplicationRecord
  has_many :students
  validates :phone_number, presence: true, uniqueness: true
  validates :otp, presence: true
end
