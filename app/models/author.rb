class Author < User
  has_many :posts
  has_many :comments

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
