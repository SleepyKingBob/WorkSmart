Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "projects" do
    get "projects/:user_id/completed", to: "projects#index_complete"
    get "projects/:project_id", to: "projects#set_active"
    resources "tasks", only: %i[new create update destroy]
  end

  resources "schedules", only: %i[new create edit update destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
