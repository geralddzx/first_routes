Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy, :show] do
    resources :contacts, only: [:index, :create, :update, :destroy, :show]
  end
  resources :contact_shares, only: [:index, :create, :update, :destroy, :show]
end
