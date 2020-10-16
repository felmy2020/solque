class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :replies, class_name: Answer, foreign_key: :reply_answer, dependent: :destroy

  # has_many :labels, through: :labelings, source: :label
  validates :title, presence: true, length: { in: 1..126 }
  validates :content, presence: true, length: { in: 1..3000 }

end
