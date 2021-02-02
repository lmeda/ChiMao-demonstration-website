class Contact < ApplicationRecord
  include EmailValidatable
  apply_simple_captcha
  
  validates :email, presence: true, email: true
  
  validates_presence_of :name, :title, :description, :company, :address, :phone
end
