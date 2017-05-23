class Photo < ActiveRecord::Base
   validates :hash,:image,presence: true
   belongs_to :user
   mount_uploader :image, ImageUploader
end
