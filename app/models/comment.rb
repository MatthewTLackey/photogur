class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :commenter

  validates :content, :presence => true
end
