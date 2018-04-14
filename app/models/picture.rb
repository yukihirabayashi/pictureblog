class Picture < ApplicationRecord
 
 belongs_to :user
 has_many :favorites, dependent: :destroy
 has_many :favorite_users, through: :favorites, source: :user
 
 #バリデーション
 validates :content, presence: true
 validates :image, presence: true
     
 # validates :image, presence: true
    mount_uploader :image, PictureUploader

    
   
end
