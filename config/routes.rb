Rails.application.routes.draw do
  get 'basis_lessons/new'

  root to: 'static_pages#guest'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'home', to: 'users#home'
  get 'ustream', to: 'events#ustream'
  get 'favoritings', to: 'users#favoritings'
  get 'favorite_ranks', to: 'lessons#favorite_ranks'
  get 'finished', to: 'events#finished'
  get 'thumbnails', to: 'basis_lessons#thumbnails'
  get 'grammer', to: 'basis_lessons#grammer'
  get 'reading', to: 'basis_lessons#reading'
  get 'japanese', to: 'basis_lessons#japanese'
  get 'kobun', to: 'basis_lessons#kobun'
  get 'mathematics_1a', to: 'basis_lessons#mathematics_1a'
  get 'mathematics_2b', to: 'basis_lessons#mathematics_2b'
  get 'mathematics_3', to: 'basis_lessons#mathematics_3'
  get 'physis', to: 'basis_lessons#physis'
  get 'chemistry', to: 'basis_lessons#chemistry'
  get 'english_reserved_list', to: 'reservations#english_reserved_list'
  get 'mathematics_reserved_list', to: 'reservations#mathematics_reserved_list'
  get 'japanese_reserved_list', to: 'reservations#japanese_reserved_list'
  get 'kobun_reserved_list', to: 'reservations#kobun_reserved_list'
  get 'subject_select', to: 'reservations#subject_select'
  get 'reservations/new/:subject/:reception_date/:recept', to: 'reservations#new', as: :new_reservation
  resources :reports
  resources :reservations
  resources :basis_lessons
  resources :events
  resources :users
  resources :lessons
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
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
