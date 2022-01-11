class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :user_id, inverse_of: :comments
  belongs_to :post, dependent: :destroy

  validates :body, presence: true
end
