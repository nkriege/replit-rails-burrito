Rails.application.routes.draw do
  resources :fillings do
    collection do
      get :tuples, constraints: { format: 'json' }
    end
  end

  resources :orders

  # Defines the root path route ("/")
  root 'application#root'
end
