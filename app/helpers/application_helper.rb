module ApplicationHelper
  def resource_name
    :user
  end

  def devise_resource
    @devise_resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
