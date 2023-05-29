Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  #管理者用
  namespace :admin do
    #ホーム画面
    get'top' => 'homes#top', as: 'top'
    #気分の選択
    resources :feelings, only: [:index, :edit, :create, :update, :destroy]
    #ゲームジャンル
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    #ユーザー
    resources :users, only: [:index, :show, :edit, :update]
  end
  #ユーザー用
  scope module: :public do
    #トップ画面
    root 'homes#top'
    get "home/about" => "homes#about"
    #ユーザー
    resources :users, only: [:index, :show, :edit, :update] do
    get 'friends' => 'users#friends', as: 'friends'
    get 'requests' => 'users#requests', as: 'requests'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    #投稿
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
