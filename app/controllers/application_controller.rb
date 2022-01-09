class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
