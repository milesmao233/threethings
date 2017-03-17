Rails.application.routes.draw do
    devise_for :users

    namespace :account do
        resources :todo_lists do
            resources :todo_items do
                member do
                    put :complete
                    put :cancel
                end
            end
            resources :reviews
        end
    end

    root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
