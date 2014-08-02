Rails.application.routes.draw do
  get 'session/create'

  get 'session/destroy'

  devise_for :users

  root 'home#index'
  scope 'api' do
    get '/', to: HomeController.action(:index)
    scope 'v1' do
      get '/', to: HomeController.action(:index)
      resources :users do 
        resources :tasks do
          resources :tickets
        end
      end
    end
  end

end
