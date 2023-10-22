Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'asas#index'
  get 'asas/animal' => 'asas#animal'
  get 'asas/style' => 'asas#style'
  get 'asas/music' => 'asas#music'
  get 'asas/trip' => 'asas#trip'
  get 'asas/food' => 'asas#food'
  get 'asas/anime' => 'asas#anime'
  get 'asas/movie' => 'asas#movie'
  get 'asas/sport' => 'asas#sport'
  get 'asas/manga' => 'asas#manga'
  get 'asas/study' => 'asas#study'
  get 'asas/business' => 'asas#business'
  get 'asas/tvshow' => 'asas#tvshow'
  get 'asas/celebrity' => 'asas#celebrity'
  get 'asas/event' => 'asas#event'
  get 'asas/beauty' => 'asas#beauty'
  get 'asas/meme' => 'asas#meme'
  get 'asas/game' => 'asas#game'
  get 'asas/others' => 'asas#others'
resources :users, only: [:show]
  resources :asas do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
end
end