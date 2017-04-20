Rails.application.routes.draw do
  devise_for :users
  resources :calendars
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'

  match '*path' => redirect('/'), via: :all #if Rails.env.production?
end
