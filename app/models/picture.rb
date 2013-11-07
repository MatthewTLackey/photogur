class Picture < ActiveRecord::Base
  has_many :comments

  scope :newest_first, -> { order("created_at DESC") }
  scope :most_recent_five, -> { newest_first.limit(5) }
  scope :created_within, ->(time) { where("created_at > ?", time) }
end

