Rails.application.routes.draw do
  root 'application#root'
  get '/colors', constraints: { format: 'json' }, to: 'application#colors'

  resources :meats do
    collection do
      get :tuples, constraints: { format: 'json' }
    end
  end

  resources :orders
end
