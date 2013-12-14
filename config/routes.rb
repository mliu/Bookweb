Hbook::Application.routes.draw do
  root 'books#search'
  get 'about' => 'info#about'
  resources :books
  get '/search', to: 'books#search', as: :search
  get 'sell' => 'books#new'
  get '/contact', to: 'info#contact'
  get 'sell1', to: 'books#sell1'
  get 'email_user' => 'books#email_user'

end