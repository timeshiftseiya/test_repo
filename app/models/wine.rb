class Wine < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
    
  validates :content, presence: true
  validates :image, presence: true
  validates :name, presence: true
    
  mount_uploader :image, ImageUploader
end
