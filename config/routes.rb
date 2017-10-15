Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles #faz uma serie de paths padroes como articles#index, articles#new, articles#show (GET,POST,PUT,DELETE) e as views e actions(no controller de articles) respectivas devem ser implementadas para funcionamento
  root 'welcome#home' #set the root url for the app

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
