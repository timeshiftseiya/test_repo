class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :wines
   has_many :favorites, dependent: :destroy
   has_many :favorite_wines, through: :favorites, source: :wine
   has_many :comments, dependent: :destroy
   
   mount_uploader :avatar, AvatarUploader
end
