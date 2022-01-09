class Author < User
  has_many :posts, foreign_key: :user_id, inverse_of: :author
  has_many :comments, foreign_key: :user_id, inverse_of: :author

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
