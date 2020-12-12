class Showcase < ApplicationRecord
  validates_presence_of :title

  mount_uploader :image, ImageUploader
  mount_uploader :drawing, DrawingUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
