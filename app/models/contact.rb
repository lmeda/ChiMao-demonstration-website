class Contact < ApplicationRecord
  apply_simple_captcha
  
  validates_presence_of :name, :title, :description, :company, :address, :phone, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
