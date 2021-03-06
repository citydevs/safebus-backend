Rails.application.routes.draw do
  resources :alerts

  devise_for :users, :skip => [:registrations], :controllers => { sessions: 'sessions'}                                        
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
  end

  post 'users', to: 'users#set_reg', defaults: {format: :json}
  get 'bus/password', to: 'clients#get_password', defaults: {format: :json}
  resources 'passwords'
  get 'password', to: 'passwords#show'
  post 'password', to: 'passwords#create'
  resources :clients

  resources :locations 

  resources :routes

  resources :buses
  get 'api/send_gcm' => 'welcome#send_gcm', defaults: {format: :json}

  get 'api/locations/buses', to: 'locations#buses', defaults: {format: :json}
  get 'api/client_panic', to: 'clients#client_panic', defaults: {format: :json}

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
