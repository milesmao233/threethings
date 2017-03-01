Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists do
    resources :todo_items do
      member do
        put :complete
      end
    end
  end
  root 'todo_lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
