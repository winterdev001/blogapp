Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs do
    member do 
      get 'blogs/most_popular'
      get 'blogs/blog_detail'
    end
  end
end
