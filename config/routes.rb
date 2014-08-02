Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  scope 'api' do
    get '/', to: HomeController.action(:index)
    scope 'v1' do
      get '/', to: HomeController.action(:index)
      resources :session, only: [:create, :destroy]
      resources :users do 
        resources :tasks do
          resources :tickets
        end
      end
    end
  end

end
