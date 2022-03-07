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

  get 'homes/homepage'
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
  get '/contact', to: 'homes#contact', as: 'contact'

  # カート用のroutes
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  # order_items用のroutes
  post 'order_items' => 'order_items#create'
  get 'order_items/:id' => 'order_items#show', as: 'order_item'
  delete 'order_items/:id' => 'order_items#destroy'
  post 'order_items/:id/add' => 'order_items#add_quantity', as: 'order_item_add'
  post 'order_items/:id/reduce' => 'order_items#reduce_quantity', as: 'order_item_reduce'

  resources :customers, only: [:index, :show, :edit, :update]
  resources :items
  resources :orders, only: [:new, :create, :index, :show]
  get 'confirm_order', to: 'orders#confirm_order', as: 'confirm_order'
  get 'complete_order', to: 'orders#complete_order', as: 'complete_order'
end