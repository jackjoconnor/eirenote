class Note < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true,
                  uniqueness: { case_sensitive: false }
  validates :content, presence: true
end
