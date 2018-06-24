class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :wines
   has_many :favorites, dependent: :destroy
   has_many :favorite_wines, through: :favorites, source: :wine
   has_many :comments, dependent: :destroy
   has_many :relationships, foreign_key: "follower_id", dependent: :destroy
   has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
   has_many :followed_users, through: :relationships, source: :followed
   has_many :followers, through: :reverse_relationships, source: :follower
   
   mount_uploader :avatar, AvatarUploader
   
  #  validates :avatar, presence: true
   
   def follow!(other_user)
     relationships.create!(followed_id: other_user.id)
   end

#フォローしているかどうかを確認する
   def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
   end
   
   def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
   end
end
