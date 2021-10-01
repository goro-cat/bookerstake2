Rails.application.routes.draw do

  root 'homes#top'##rootの場合、'homes/top'だとエラーが発生
  get 'home/about' => 'homes#index'

  devise_for :users#devise作成時に自動的に追加される。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :index, :show, :edit, :destroy]##resourcesメゾッドはルーティングを一括で自動生成してくれる。
  resources :books, only: [:create, :index, :show, :edit, :destroy] do
    resources :post_comments, only: [:create, :destroy]##only: [:]を忘れない。本についてコメントしていく親子関係(ネスト関係)の為do~endでまとめる
  end

end
