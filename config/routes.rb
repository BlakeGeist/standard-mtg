Rails.application.routes.draw do

  get 'ori/index', path: "magic-origins"
  get "magic-origins/red" => "ori#red"
  get "magic-origins/black" => "ori#black"
  get "magic-origins/green" => "ori#green"
  get "magic-origins/blue" => "ori#blue"
  get "magic-origins/white" => "ori#white"
  get "magic-origins/artifact" => "ori#artifact"

  get 'dtk/index', path: "dragons-of-tarkir"
  get "dragons-of-tarkir/red" => "dtk#red"
  get "dragons-of-tarkir/black" => "dtk#black"
  get "dragons-of-tarkir/green" => "dtk#green"
  get "dragons-of-tarkir/blue" => "dtk#blue"
  get "dragons-of-tarkir/white" => "dtk#white"
  get "dragons-of-tarkir/artifact" => "dtk#artifact"

  get 'bfz/index', path: "battle-for-zendikar"
  get "battle-for-zendikar/red" => "bfz#red"
  get "battle-for-zendikar/black" => "bfz#black"
  get "battle-for-zendikar/green" => "bfz#green"
  get "battle-for-zendikar/blue" => "bfz#blue"
  get "battle-for-zendikar/white" => "bfz#white"
  get "battle-for-zendikar/artifact" => "bfz#artifact"

  get 'ogw/index', path: "oath-of-the-gatewatch"
  get "oath-of-the-gatewatch/red" => "ogw#red"
  get "oath-of-the-gatewatch/black" => "ogw#black"
  get "oath-of-the-gatewatch/green" => "ogw#green"
  get "oath-of-the-gatewatch/blue" => "ogw#blue"
  get "oath-of-the-gatewatch/white" => "ogw#white"
  get "oath-of-the-gatewatch/artifact" => "ogw#artifact"
  get "oath-of-the-gatewatch/colorless" => "ogw#colorless"

  get 'w16/index', path: "welcome-deck-2016"
  get "welcome-deck-2016/red" => "w16#red"
  get "welcome-deck-2016/black" => "w16#black"
  get "welcome-deck-2016/green" => "w16#green"
  get "welcome-deck-2016/blue" => "w16#blue"
  get "welcome-deck-2016/white" => "w16#white"
  get "welcome-deck-2016/artifact" => "w16#artifact"

  get "soi/index", path: "shadows-over-innistrad"
  get "shadows-over-innistrad/red" => "soi#red"
  get "shadows-over-innistrad/black" => "soi#black"
  get "shadows-over-innistrad/green" => "soi#green"
  get "shadows-over-innistrad/blue" => "soi#blue"
  get "shadows-over-innistrad/white" => "soi#white"
  get "shadows-over-innistrad/artifact" => "soi#artifact"

  get 'cards/index'
  get "/red" => "cards#red"
  get "/black" => "cards#black"
  get "/green" => "cards#green"
  get "/blue" => "cards#blue"
  get "/white" => "cards#white"
  get "/artifact" => "cards#artifact"


  get 'mechanics/index'
  resources :mechanics

  get 'subtypes/index'
  resources :subtypes

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
