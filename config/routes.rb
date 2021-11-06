Rails.application.routes.draw do
  resources :instructors, only: [:create, :index, :update, :destory]
  resources :students, only: [:create, :index, :update, :destory]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
