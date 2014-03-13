Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root 'main_site#index'

  scope path: '/mo', controller: :mo_site, as: 'mo' do
    get '' => :index, as: :index
    get 'sc_index' => :sc_index, as: :sc_index
    get 'special/:id' => :special, as: :special
    get 'category/:id' => :category, as: :category
    get 'item/:id' => :item, as: :item
    get 'about' => :about, as: :about
  end

  scope controller: :main_site, as: 'main_site' do
    # Use static pages!
    #get 'about' => :about
    #get 'dept/:id' => :dept, as: 'dept'
    get 'contact' => :contact
    post 'contact' => :contact
    get 'article/:id' => :article, as: :article
  end

  devise_for :cmw_accounts
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
