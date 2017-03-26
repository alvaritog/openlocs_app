Rails.application.routes.draw do
  resources :locations
  root to: 'visitors#index'
  devise_for :users
  scope as: "manage" do
    resources :users
  end  
end
