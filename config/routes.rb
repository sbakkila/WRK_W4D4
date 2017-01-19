Rails.application.routes.draw do
  root to: redirect("/users")

  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show, :index]

  resources :bands, only: [:index, :create, :edit, :destroy] do
    resources :albums, only: [:create]
  end

  resources :albums, only: [:edit, :show, :update, :destroy] do
    resources :tracks, only: [:create]
  end
  resources :tracks, only: [:edit, :show, :update, :destroy]
end
