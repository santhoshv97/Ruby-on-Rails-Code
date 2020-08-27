Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees do
        resources :customers
      end
      resources :employees
      resources :addresses
    end
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

