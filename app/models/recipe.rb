class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :name, :summary, :description, :chef, presence: true
  validates :name, length: {minimum: 5, maximum: 250}
  validates :summary, length: {minimum: 5, maximum: 350}
  validates :description, length: {minimum: 5, maximum: 3000}
  
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 8.megabytes
        errors.add(:picture, "Should be less than 8MB")
      end
    end
end