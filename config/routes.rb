Rails.application.routes.draw do
  devise_for :routes
  resources :user_stocks, only: [:create]
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
    #get 'ajax/:action', to: 'ajax#:action', defaults: { format: 'json' }
end
