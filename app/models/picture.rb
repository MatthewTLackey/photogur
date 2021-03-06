class Picture < ActiveRecord::Base
  has_many :comments
  mount_uploader :image, ImageUploader

  scope :newest_first, -> { order("created_at DESC") }
  scope :most_recent_five, -> { newest_first.limit(4) }
  scope :created_within, ->(time) { where("created_at > ?", time) }
end

