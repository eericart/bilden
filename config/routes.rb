
  get 'records/show'

  get 'records/index'

  get 'records/update'

  get 'records/edit'

  namespace :admin do
    resources :careers
  end

  root 'home#index'
  resources :uploads, only: [:index, :new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  resources :careers
  resources :students
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signin',  to: 'sessions#create',      via: 'post'
  match '/signup',  to: 'users#create',         via: 'post'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/dash-student', to: 'students#show',   via: 'get'
  match '/uploads/new', to: 'uploads#new', via:'post'

  match '/signup/step2', to: 'users#record', via:'get'
  match '/signup/step2', to: 'users#record', via:'post'

  resources :records, only: [:index, :new, :create, :show]
  #Why cannot use

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
