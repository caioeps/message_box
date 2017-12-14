Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "user/registrations"
    }
end
