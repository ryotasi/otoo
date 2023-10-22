class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        has_many :asas, dependent: :destroy
        validates :name, presence: true
        validates :profile, length: { maximum: 200 }
        has_many :likes, dependent: :destroy
        has_many :liked_asas, through: :likes, source: :asa
        mount_uploader :image, ImageUploader
        has_many :comments, dependent: :destroy
        def already_liked?(asa)
          self.likes.exists?(asa_id: asa.id)
        end 
end
