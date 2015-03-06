Rails.application.routes.draw do
  root 'home#index'

  get 'blog/archive/:year/:month' => 'posts#index'
  resources :posts, :path => 'blog'

  resources :messages

  # Authentication
  get 'session/login'
  get 'session/logout'

  get 'photos' => 'photos#index'

  get 'contact' => 'messages#new'

  get 'projects/charts/:id' => 'charts#index'

  # Static pages
  get 'about' => 'static_pages#view', defaults: { id: 'about' }
  get 'projects' => 'static_pages#view', defaults: { id: 'projects' }
  get 'page/:id' => 'static_pages#view'

  # Error pages
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
