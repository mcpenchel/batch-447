class PlantTag < ApplicationRecord
  belongs_to :plant
  belongs_to :tag

  validates :plant, uniqueness: { scope: :tag }
end
