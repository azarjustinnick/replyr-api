Rails.application.routes.draw do
  match '*all' => 'application#cors_preflight_check', via: :options

  get 'home/index'

  get 'chat/channel/:name' => 'chat#channel'
  post 'chat/channel/:name/message' => 'chat#create_message'
  post 'chat/channel/:name/post' => 'chat#create_post'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
