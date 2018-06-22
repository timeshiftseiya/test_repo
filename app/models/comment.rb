class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  
  validates :content, presence: true
end
