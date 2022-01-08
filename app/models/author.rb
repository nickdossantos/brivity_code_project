class Author < User
  has_many :posts
  has_many :comments
end
