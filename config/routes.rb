Rails.application.routes.draw do
  resources :noodles do
    resources :options, only: [ :create, :update, :destroy ]
    resources :vote_sets, only: [ :create, :update, :destroy ] do
      resources :votes, only: [ :create, :update, :destroy ]
    end
  end

  get 'faq', to: 'static_pages#faq'

  root to: 'static_pages#home'
end
