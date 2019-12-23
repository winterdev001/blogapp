Rails.application.routes.draw do
  resources :contacts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  resources :abouts
  get 'abouts/about'
  root 'blogs#index'
  resources :blogs do
    member do 
      get 'blogs/most_popular'
      get 'blogs/blog_detail'
      get 'blogs/about'
      get 'blogs/all_blogs'      
    end
  end
end
