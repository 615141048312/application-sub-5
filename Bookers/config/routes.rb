Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#root'
  get '/home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    get :follows, :followers
  end
  get '/search' => 'search#search', as: 'search'
  post '/follow/:id' => 'relationships#create', as: 'follow'
  delete '/unfollow/:id' => 'relationships#destroy', as: 'unfollow'


  resources :books, except: :new do
  	resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
