Rails.application.routes.draw do
  require 'sidekiq/web'

  scope :api do
    scope :v1 do 
      mount_devise_token_auth_for 'User', at: 'auth'
      mount_devise_token_auth_for 'Admin', at: 'admin_auth'
      mount_devise_token_auth_for 'Dealer', at: 'dealer_auth'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/' => 'public/api#index'
      namespace :backoffice do
        as :admin do
          resources :users
        end
      end
      namespace :dealers do
        get '/' => 'dealers#index'
        as :dealer do
          resources :dealers
        end
      end
    end
  end  
  
  
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  root to: proc { [404, {}, ["Not found."]] }
end
