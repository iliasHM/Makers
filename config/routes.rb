Rails.application.routes.draw do
  #Omniauth callback
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }

  ActiveAdmin.routes(self)

  root to: "pages#home"


  resources :machines, only: [:index, :search, :show]

  resources :orders, only: [:create]
  resources :workshops, only: [:show]


  resource :account, only: [:show, :edit, :update] do
    resource :workshop, only: [:show, :new, :create, :edit, :update], module: :accounts do
      resources :machines, only: [:new, :create]
    end
    resources :machines, only: [:index, :edit, :update], module: :accounts
    resources :orders, only: [:index, :show, :update], module: :accounts
    resources :received_orders, only: [:index, :show, :update], module: :accounts
  end

  post "/get_models", to: "javascript#get_models"

  get "/credits", to: "pages#credits"
  get "/search", to: "machines#search"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
