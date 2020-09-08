Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'
    end
    get 'list-doctors', to: 'list#doctors'
    get 'list-hospitals', to: 'list#hospitals'
    get 'booking-list', to: 'schedules#index'
    post 'booking', to: 'schedules#booking'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
