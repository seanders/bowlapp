BowlApp::Application.routes.draw do
  www_host = URI.parse(BowlApp::Application.config.www_url).host
  api_host = URI.parse(BowlApp::Application.config.api_url).host

    resources :people

    resources :bowls

    root :to => 'bowl_app#home'

  # scope constraints: lambda { |request| request.host == api_host } do

  # end

  # scope constraints: lambda { |request| request.host == www_host } do
  #   match '(*path)', to: 'bowl_app#home', via: [:get]
  # end
end
