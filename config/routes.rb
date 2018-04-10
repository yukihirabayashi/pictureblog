Rails.application.routes.draw do

  root to: 'pictures#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  devise_for :users
  resources :favorites, only: [:create, :destroy, :index]
  
  resources :pictures do
      collection do
       post :confirm
     end
  end


end
