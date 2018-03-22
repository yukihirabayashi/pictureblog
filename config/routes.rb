Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
#    root to: 'devise/sessions#new'
    root to: 'pictures#index'
  end

end