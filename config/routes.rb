Rails.application.routes.draw do
  root 'messages#index'

  devise_for :users,
    controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  resources :messages, only: %i[index create new]
end
