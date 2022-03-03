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

  resources :items
end
