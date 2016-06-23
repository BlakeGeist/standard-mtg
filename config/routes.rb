Rails.application.routes.draw do

  get 'ori/index', path: "magic-origins"

  get 'dtk/index', path: "dragons-of-tarkir"

  get 'bfz/index', path: "battle-for-zendikar"

  get 'ogw/index', path: "oath-of-the-gatewatch"

  get 'w16/index', path: "welcome-deck-2016"

  get "soi/index", path: "shadows-over-innistrad"
  get "shadows-over-innistrad/red" => "soi#red"
  get "shadows-over-innistrad/black" => "soi#black"
  get "shadows-over-innistrad/green" => "soi#green"
  get "shadows-over-innistrad/blue" => "soi#blue"
  get "shadows-over-innistrad/white" => "soi#white"
  get "shadows-over-innistrad/artifact" => "soi#artifact"


  get 'properties/index'
  resources :properties

  get 'cards/index'
  resources :cards, :path => ''
  root 'cards#index'

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
