Rails.application.routes.draw do
  get 'faq', to: 'static_pages#faq'

  root to: 'static_pages#home'
end
