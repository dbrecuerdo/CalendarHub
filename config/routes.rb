Rails.application.routes.draw do
  get 'master_calendar/view'
  get 'master_calendar/view_day'
  resources :calendars
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'master_calendar#view'
end
