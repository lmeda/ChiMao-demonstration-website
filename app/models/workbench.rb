class Workbench < ApplicationRecord
  belongs_to :category 
  validates_presence_of :title

  mount_uploader :product, ProductUploader
  mount_uploader :specification, SpecificationUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
