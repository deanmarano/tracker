Tracker::Application.routes.draw do
  resources :tasks do
    member do
      post :claim
    end
  end
  post 'tasks/:id/:state_transition' => 'tasks#state_transition', as: :state_transition

  resources :users


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  root 'tasks#index'
end
