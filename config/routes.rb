Rails.application.routes.draw do
  root 'posts#index'

  get 'blog/archive/:year/:month' => 'posts#index', :as => 'blog_archive'
  get 'blog/tag/:tag' => 'posts#index', :as => 'blog_tag'
  get 'blog/archive/:year/:month' => 'posts#index'
  resources :posts, :path => 'blog', :except => :index

  resources :messages

  resources :pages

  # Authentication
  get 'session/login'
  get 'session/logout'

  get 'photos' => 'photos#index'

  get 'contact' => 'messages#new'

  get 'projects/charts/:id' => 'charts#index'

  # Static pages
  get 'about' => 'pages#show', defaults: { id: 'about' }
  get 'projects' => 'pages#show', defaults: { id: 'projects' }

  # Error pages
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
