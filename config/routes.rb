# coding: utf-8
Rails.application.routes.draw do
  
  get 'posts/index'
  get '/' => 'home#top'
  get 'about' => 'home#about'

  # progate ruby 用
  get 'ruby/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
