Rails.application.routes.draw do
  devise_for :users
  resources :pictures
#  devise_scope :user do
#    root to: 'devise/sessions#new'
    root to: 'pictures#index'
#  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end