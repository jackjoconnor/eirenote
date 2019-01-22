class Note < ApplicationRecord
  include PgSearch
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :location, presence: true

  # :search_by_title_and_content_and_location is a class method
  # rails c
  # Note.search_by_title_and_content_and_location

  pg_search_scope :search_by_title_and_content_and_location, 
    against: [:title, :content, :location],
    using: {
      tsearch: { prefix: true }
    }

end
