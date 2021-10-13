Rails.application.routes.draw do
  get 'manage/index'
  get 'infor/index'
  get 'login/user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'login#user'
end
