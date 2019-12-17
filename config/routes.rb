Rails.application.routes.draw do
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
