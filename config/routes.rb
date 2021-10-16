Rails.application.routes.draw do
  resources :ponies
  get 'infor/' ,to: "infor#index"
  get 'login/' ,to: "login#user"
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #get '/login', :controller => 'login', :action => 'submit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'manage/shifttime',to: "manage#shifttime"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "login#user"
  
  resources :manage do
    resources :shifttime
  end
end
