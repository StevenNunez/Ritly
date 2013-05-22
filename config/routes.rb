Ritly::Application.routes.draw do
  root "home#index"
  resources :urls
  get '/:some_totally_random_value', to: 'urls#redirectors'
  get '/:some_totally_random_value/preview', to: 'urls#preview'
end
