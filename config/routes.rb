Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/admin', to: 'pages#admin'
  get '/subscribe', to: 'pages#subscribe'
  get '/feedback', to: 'pages#feedback'
  resources :users, except: %i[new create delete]
  resources :universities, :careers, :courses, :topics, :lessons
end
