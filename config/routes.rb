Rails.application.routes.draw do
  resources :noodles do
    resources :options, only: [ :create, :update, :destroy ]
  end

  get 'faq', to: 'static_pages#faq'

  root to: 'static_pages#home'
end
