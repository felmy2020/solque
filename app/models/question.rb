class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  belongs_to :user
  validates :title, presence: true, length: { in: 1..126 }
  validates :content, presence: true, length: { in: 1..3000 }
end
