class User < ApplicationRecord
  validates :name, presence: true
  mount_uploader :icon, ImageUploader
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_questions, through: :answers, source: :question
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_questions, through: :bookmarks, source: :question
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
