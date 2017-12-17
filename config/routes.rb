Rails.application.routes.draw do
  root 'messages#index'

  devise_for :users,
    controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  namespace :messages do
    resources :archives, only: %i[index create]
  end

  resources :messages, only: %i[index create new show]
end
