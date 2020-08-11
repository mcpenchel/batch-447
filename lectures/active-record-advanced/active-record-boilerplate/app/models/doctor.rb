class Doctor < ActiveRecord::Base

  SPECIALTIES = ["Neurologist", "Kids", "Witch-doctor"]

  # instance method that returns an array of interns instances
  has_many :interns

  has_many :consultations
  has_many :patients, through: :consultations

  validates :first_name, uniqueness: { scope: :last_name }
  validates :specialty, inclusion: { in: SPECIALTIES }
  validates :first_name, presence: true
  # same as above!!
  # validates :last_name,  uniqueness:  { scope: :first_name }
end
