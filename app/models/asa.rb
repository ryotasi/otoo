class Asa < ApplicationRecord
    belongs_to :user 
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    mount_uploader :image, ImageUploader
    has_many :comments, dependent: :destroy
    validates :category,presence:true
    def already_liked?(asa)
        self.likes.exists?(asa_id: asa.id)
    end
end
