StackOverflow::Application.routes.draw do
  root to: 'questions#index'
  resources :users
  resources :questions
  resources :sessions

end
