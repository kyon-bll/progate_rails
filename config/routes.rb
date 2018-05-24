# coding: utf-8
Rails.application.routes.draw do
  
  get 'posts' => 'posts#index'
  get 'posts/new'
  post 'posts/create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id' => 'posts#show'

  get '/' => 'home#top'
  get 'about' => 'home#about'

  # progate ruby 用
  get 'ruby/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
