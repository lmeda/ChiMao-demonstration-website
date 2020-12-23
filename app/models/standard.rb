class Standard < ApplicationRecord
  belongs_to :category 
  validates_presence_of :title, :model_number
end
