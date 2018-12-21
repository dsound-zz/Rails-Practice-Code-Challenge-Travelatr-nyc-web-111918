Rails.application.routes.draw do




  resources :bloggers
  resources :destinations
  resources :posts, only: [:index, :show, :new, :edit, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch '/posts/:id' => 'posts#like', as: 'like'
  get '/search/' => "search#index"
  get '/search/:id' => "search#show"


end
