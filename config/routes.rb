Rails.application.routes.draw do
  # 管理者用のログイン
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員側用の新規登録やログインなど
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # PFのホームページ
  get 'homes/homepage'


  get 'admin/dashboard', to: 'homes#dashboard', as: 'dashboard'

  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  get '/contact', to: 'homes#contact', as: 'contact'

  # お知らせ用のroutes
  resources :posts, only: [:create, :index, :edit, :update, :destroy]

  # カート用のroutes
  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"

  # order_items用のroutes
  post 'order_items', to: 'order_items#create'
  get 'order_items/:id', to: 'order_items#show', as: 'order_item'
  delete 'order_items/:id', to: 'order_items#destroy'
  post 'order_items/:id/add', to: 'order_items#add_quantity', as: 'order_item_add'
  post 'order_items/:id/reduce', to: 'order_items#reduce_quantity', as: 'order_item_reduce'

  resources :customers, only: [:index, :show, :edit, :update]
  resources :items
  resources :orders, only: [:new, :create, :index, :show]
  get 'confirm_order', to: 'orders#confirm_order', as: 'confirm_order'
  get 'complete_order', to: 'orders#complete_order', as: 'complete_order'

  # 店内用の情報
  resources :revenues, only: [:index, :create, :destroy]
  get 'ec_info', to: 'revenues#ec_info'
  # グラフをデータによって変更（JSを使用）
  get 'ec_filter', to: 'revenues#ec_filter', as: 'ec_filter'
  get 'store_filter', to: 'revenues#store_filter', as: 'store_filter'
end