class Note < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  # validates :title, presence: true
  validates :content, presence: true
end
