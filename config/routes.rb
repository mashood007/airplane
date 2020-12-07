Rails.application.routes.draw do
  resources :planes do
    get :fill_seats, on: :member
  end
  root 'planes#index'
end
