class Category < ApplicationRecord
  has_many :showcases
  has_many :workbenches
end
