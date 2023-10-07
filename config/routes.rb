Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"

  devise_for :users

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy] #いいね用ルーティング
    resources :book_comments, only: [:create, :destroy] #コメント用ルーティング
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy] #フォロー、フォロワー用ルーティング
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end
  get "search" => "searches#search_result"#searchesコントローラーのsearch_resultというアクションを呼び出す
  #post "search" => "searches#search_result"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end #endの記述がなかったので追加