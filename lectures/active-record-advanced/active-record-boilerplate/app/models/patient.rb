class Patient < ActiveRecord::Base
  belongs_to :intern
  has_many :consultations
  has_many :doctors, through: :consultations

  # validates :name, presence: true
  # validates :disease, presence: true

  validates :name, :disease, presence: true

end
