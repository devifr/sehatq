Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post 'sign-up', to: 'registrations#create'
      post 'sign-in', to: 'sessions#create'
      delete 'sign-out', to: 'sessions#destroy'
    end
    get 'list-doctors', to: 'list#doctors'
    get 'list-hospitals', to: 'list#hospitals'
    get 'list-booking', to: 'list#index'

    get 'booking-list', to: 'schedules#index'
    post 'booking', to: 'schedules#booking'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
