Rails.application.routes.draw do

  root to: 'pictures#index'

# devise_for :users, :controllers => {
#    :sessions         =>  "users/sessions",
#    :registrations    =>  "users/registrations",
#    :password         =>  "users/password"
#}

 
 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
   devise_for :users
    resources :favorites, only: [:create, :destroy]
  
  resources :pictures do
      collection do
       post :confirm
     end
   end


end
