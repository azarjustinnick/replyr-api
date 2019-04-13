Rails.application.routes.draw do
  get 'home/index'

  get 'chat/channel/:name' => 'chat#channel'
  post 'chat/channel/:name/message' => 'chat#create_message'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
