Rails.application.routes.draw do
  # アプリケーションが正常に動作しているかどうかを確認するためのルーティング
  get "up" => "rails/health#show", as: :rails_health_check
  # PWAに必要なサービスワーカーを提供するためのルーティング
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # PWAのマニフェストファイルを提供するためのルーティング
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root to: "home#index"

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "main/index", to: "main#index", as: "main_index" # トップからログインした際のルーティング
  get "home/index", to: "home#index", as: "home_index" # ログイン失敗後トップページに遷移

  resources :users do
    resources :drug_supplement_lists, only: %i[ index create ]
    resources :drugs, only: %i[ edit update destroy ]
    resources :supplements, only: %i[ edit update destroy ]
    resources :symptoms, only: %i[ index create edit update destroy ]
    resources :schedules
    resources :records, only: %i[ new create create edit update destroy ]
  end
end
