BowlApp::Application.routes.draw do
  www_host = URI.parse(BowlApp::Application.config.www_url).host

  resources :people

  resources :bowls

  # scope constraints: lambda { |request| request.host == www_host } do
  #   match '(*path)', to: 'bowl_app#home', via: [:get]
  # end
end
