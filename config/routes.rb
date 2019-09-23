Rails.application.routes.draw do
  resources :static_pages, only: [:create, :index]
  root "static_pages#index"
end
