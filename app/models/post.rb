class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'user_id', class_name: 'Author', inverse_of: :posts
  has_many :comments, -> { order(created_at: :asc) }

  validates :title, presence: true
  validates :body, presence: true
end
