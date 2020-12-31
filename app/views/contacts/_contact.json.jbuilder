json.extract! contact, :id, :title, :description, :name, :company, :address, :zip, :phone, :fax, :email, :created_at, :updated_at
json.url contact_url(contact, format: :json)
