class Post < ApplicationRecord
  belongs_to :user
  belongs_to :author, foreign_key: 'user_id', class_name: 'Author', inverse_of: :posts
  has_many :comments

  accepts_nested_attributes_for :comments
end
