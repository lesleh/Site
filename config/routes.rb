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

  # Static pages
  get 'about' => 'static_pages#view', defaults: { id: 'about' }
  get 'projects' => 'static_pages#view', defaults: { id: 'projects' }
end
