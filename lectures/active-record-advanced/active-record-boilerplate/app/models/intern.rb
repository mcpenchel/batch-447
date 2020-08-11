class Intern < ActiveRecord::Base
  # instance method that returns a doctor instance
  belongs_to :doctor
  has_many :patients
end
