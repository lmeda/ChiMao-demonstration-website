class Category < ApplicationRecord
  has_many :standards
  has_many :showcases
  has_many :workbenches
end
