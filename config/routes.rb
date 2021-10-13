Rails.application.routes.draw do
  get 'manage/', to: "manage#index"
  get 'infor/', to: "infor#index"
  get 'login/', to: "login#user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'login#user'
end
