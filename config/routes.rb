Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations'}

  resources :users do
    resources :pcards
  end

  get 'dashboards/index', path: "collection"
  get 'admins/index'
  get 'ebay/index'

  resources :top50s
  resources :top_cards

  resources :application do
    collection do
      get :open_modal
      get :ebayRequest
    end
  end

  resources :dashboards do
    collection do
      post :ebayRequest
      get :findItemsByKeywords
    end
  end

  resources :ebay do
    collection do
      get :ebayGetItem
    end
  end

  get 'cards/index'
  get "/red" => "cards#red"
  get "/black" => "cards#black"
  get "/green" => "cards#green"
  get "/blue" => "cards#blue"
  get "/white" => "cards#white"
  get "/artifact" => "cards#artifact"

  resources :admins do
    collection do
      get :import_set
      get :delete_set_and_cards
      get :getTokenStatus
    end
  end
  resources :colors

  resources :crarities
  resources :pcards
  resources :alls


  get 'mechanics/index'
  resources :mechanics

  get 'subtypes/index'
  resources :subtypes

  root 'cards#index'

  resources :cards do
    resources :tcg_prices
  end

  resources :cardsets, path: 'set' do
    resources :cards, path: ''
  end

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
