Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attachments
  root to: "attachments#index"
  get '/download', to: 'attachments#download'
end
