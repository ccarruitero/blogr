Rails.application.routes.draw do
  resources :blogs do
    resources :comments

    get 'get_comments', to: 'blogs#get_comments'
  end
end
