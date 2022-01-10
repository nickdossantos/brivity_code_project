module AuthorsHelper
  def ensure_my_profile?(author)
    return false unless current_user

    current_user.id == author.id
  end
end
