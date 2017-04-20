Rails.application.routes.draw do
  get 'master_calendar/view'
  resources :calendars
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'master_calendar#view'

  match '*path' => redirect('/'), via: :all #if Rails.env.production?
end
