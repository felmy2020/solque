class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { in: 1..1048 }
end
