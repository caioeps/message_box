Rails.application.routes.draw do
  namespace :api do
    get 'messages/index'
  end

  namespace :api do
    get 'messages/create'
  end

  root 'messages#index'

  devise_for :users,
    controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  namespace :api do
    resources :messages, only: %i[index create new show], defaults: { format: :json }
  end

  namespace :messages do
    resources :archives, only: %i[index]

    namespace :archives do
      resources :toggle, only: %i[update]
    end
  end

  resources :messages, only: %i[index create new show]
end
