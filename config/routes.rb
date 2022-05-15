Rails.application.routes.draw do
  
    root 'tests#index'

    devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
    resources :tests, only: :index do
      member do
        post :start
      end      
    end  

    resources :test_passages, only: %i[ show update ] do
      member do 
        get :result
      end
      resources :gists, only: %i[ create ]
    end 
  
    namespace :admin do
      resources :tests do 
        resources :questions, shallow: true, expect: :index do
          resources :answers, shallow: true, expect: :index
        end
      end 
        resources :gists, only: %i[ index ]
    end    
         
end
