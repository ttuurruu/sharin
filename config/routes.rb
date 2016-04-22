Rails.application.routes.draw do

  resources :config_columns
  resources :config_view_columns
  scope "(:locale)" do

    resources :ability_requirements
    resources :ability_groupings
    resources :config_form_columns
    resources :config_form_footers
    resources :config_views
    resources :evaluation_details
    resources :evaluation_headers do
      member do
        get :entry
        get :edit_evaluator
      end
    end
    resources :evaluation_settings
    resources :evaluation_objectives do
      member do
        get :delete
      end
    end

    resources :evaluation_events do
      member do
        get :delete
      end
    end
    resources :members do
      member do
        get :profile_tabs
        get :profile_details
        get :profile
      end
    end
    resources :member_communications do
      collection do
        get :cancel_edit
      end
    end
    resources :member_names do
      collection do
        get :cancel
        get :cancel_edit
        get :csv
      end
    end
    resources :member_systems do
      collection do
        get :cancel
        get :cancel_edit
        get :csv
      end
    end
    resources :member_tables
    resources :member_role_details do
      member do
        get :block_edit
      end
    end
    resources :member_roles
    resources :table_settings
    resources :user_images
    resources :user_passwords
    resources :users do
      collection do
        get :activate
        get :account_new
        post :account_create
        get :account_finish
        get :password_reset_check
        get :password_reset_error
        get :password_reset_finish
      end
      member do
        get :password_reset
        patch :password_reset_update
        get :delete
      end
    end

    #ログイン
    get  'login' => 'login#index'
    post 'login/auth' => 'login#auth'

    #ログアウト
    get  'logout' => 'login#logout'

    #アカウント登録
    get  'registers' => 'registers#index'
    post 'registers/auth' => 'registers#auth'
    post 'registers/email_check' => 'registers#email_check'
    get  'registers/password_reset' => 'registers#password_reset'

    #管理
    get  'configurations' => 'configurations#index'

    get  'homes/user' => 'homes#user'
    get  'evaluations/index' => 'evaluations#index'
    get  'members/profile/:id' => 'members#profile'

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
