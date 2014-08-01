Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/create'
  # get 'users/show'
  # get 'users/update'
  # get 'users/destroy'

  # get 'tickets/index'
  # get 'tickets/create'
  # get 'tickets/show'
  # get 'tickets/update'
  # get 'tickets/destroy'

  # get 'tasks/index'
  # get 'tasks/create'
  # get 'tasks/show'
  # get 'tasks/update'
  # get 'tasks/destroy'

  # get 'session/create'
  # get 'session/destroy'

  root 'home#index'
  
  scope 'api', defaults: {format: :json} do
    scope 'v1', defaults: {format: :json} do
      resources :session, only: [:create, :destroy]
      resources :users do 
        resources :tasks do
          resources :tickets
        end
      end
    end
  end

end
