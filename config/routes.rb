Rails.application.routes.draw do

  root to: 'pictures#index'
  
  resources :pictures do
      collection do
       post :confirm
     end
   end

  devise_for :users

 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
