Rails.application.routes.draw do
  get 'home/index'

  get 'chat/channel/:name' => 'chat#channel'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
