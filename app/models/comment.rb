class Comment < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :content, presence: true, length: { in: 1..1048 }
end
