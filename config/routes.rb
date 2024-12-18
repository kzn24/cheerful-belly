Rails.application.routes.draw do
  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root to: "home#index"

  get "main/index", to: "main#index", as: "main_index" # トップからログインした際のルーティング
  get "home/index", to: "home#index", as: "home_index" # ログイン失敗後トップページに遷移
  get "drug_supplement_lists/index" # お薬とサプリリストへ

  resources :drug_supplement_lists, only: [ :index, :create ]

  # ログアウト後トップページに遷移
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
end
