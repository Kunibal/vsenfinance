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

  resources :customers, only: [:index, :show, :edit, :update]
  resources :items

  # カート用のroutes
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  # order_items用のroutes
  post 'order_items' => "order_items#create"
end