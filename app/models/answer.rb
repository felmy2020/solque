class Answer < ApplicationRecord
  belongs_to :question
  validates :content, presence: true, length: { in: 1..1048 }
end
