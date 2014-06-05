Rails.application.routes.draw do
  resources :blogs do
    resources :comments

    get 'get_comments', to: 'blogs#get_comments'
  end

  resources :books do
    resources :comments
  end

  root to: 'comments#index'
end
