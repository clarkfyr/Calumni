Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get  '/'    => 'calumnis#home', :as =>'home'
  get 'signup' => 'calumnis#signup',:as => 'signup'
  # post  'login'   => 'calumnis#login',  :as => 'login'
  post  'newProfile'   => 'calumnis#createandlogin',  :as => 'createandlogin'
  get  'login'   => 'calumnis#login',  :as => 'login'

  get  'create_mentor'   => 'calumnis#create_mentor',  :as => 'create_mentor'
  get 'testprofile' => 'calumnis#testprofile', :as =>'testprofile'
  patch 'testselect' => 'calumnis#testselect', :as => 'testselect'


  get  'create_mentee'   => 'calumnis#create_mentee',  :as => 'create_mentee'
  get  'profile'   => 'calumnis#profile',  :as => 'profile'
  get  'edit_profile'   => 'calumnis#edit_profile',  :as => 'edit_profile'
  get  'upload' => 'calumnis#upload', :as =>'upload'

  root 'calumnis#home'
  get "/auth/google_oauth2/callback", to: "auth#google_callback"
  get "/auth/logout" => "auth#logout", :as => 'logout'

  patch'upload' => 'calumnis#receiveimg', :as =>'receiveimg'

  resources :conversations do
    resources :messages
  end

# resources :calumni

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
