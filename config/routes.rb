Rails.application.routes.draw do
  get 'infor/' ,to: "infor#index"
  get 'login/' ,to: "login#user"
  post 'login' => 'login#submit'
  #get '/login', :controller => 'login', :action => 'submit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'login#user'
  
  resources :manage
end
