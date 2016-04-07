Rails.application.routes.draw do

  root 'sessions#new'

  resources :users, only: [:new, :create, :destroy]

  resources :profiles
  resources :tags, only: [:index, :show]


  resources :pull_requests
  # get 'reply' => 'pull_requests#reply'
  # get 'reply' => 'pull_requests#reply'

  resources :conversations do
    resources :messages, only: [:index, :new, :create]
      # get 'pull_request_reply' => 'messages#pull_request_reply'

  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :blocked_users, only: [:create, :destroy]


  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider


  # get 'tagged/tag.id' => 'profiles#tagged', :as => 'tagged'

  resources :about, only: [:index]
  get "about/contact" => "about#contact"


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
