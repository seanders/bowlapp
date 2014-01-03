class ApplicationController < ActionController::Base

  before_filter :set_access_control_headers

  def set_access_control_headers
    if request.host == URI.parse(BowlApp::Application.config.api_url).host
      # copied from api.github.com
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE'
      headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-Requested-With'
      headers['Access-Control-Max-Age'] = '86400'

      # OPTIONS immediately return 200 with empty body
      head(:ok) if request.request_method == "OPTIONS"
    end
  end
end
