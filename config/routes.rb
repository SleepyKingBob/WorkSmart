Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "settings", to: "pages#settings"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "projects" do
    get "projects/:user_id/completed", to: "projects#index_complete"
    get "active", to: "projects#set_active", as: "active"
    resources "tasks", only: %i[new create update destroy]
  end

  get "tasks/:id/checkbox", to: "tasks#checkbox", as: "checkbox"

  resources "schedules", only: %i[index new show create edit update destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
