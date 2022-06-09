Rails.application.routes.draw do
  get 'index/show'
  get 'index/edit'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
