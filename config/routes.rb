Rails.application.routes.draw do
  get 'homes/homepage'
  root to: 'homes#top'
  get 'homes/about'

  # 管理者用のログイン
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 会員側用の新規登録やログインなど
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
end
