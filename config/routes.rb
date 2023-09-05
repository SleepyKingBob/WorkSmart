Rails.application.routes.draw do
  devise_for :users, controllers: {
    # omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "projects/completed", to: "projects#index_complete", as: "completed_projects"
  get "calendar", to: "pages#calendar", as: "calendar"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "projects" do
    get "active", to: "projects#set_active", as: "active"
    get "unmark", to: "projects#unmark_active", as: "unmark_active"
    get "complete", to: "projects#complete", as: "complete"
    get "incomplete", to: "projects#incomplete", as: "incomplete"
    
    resources "tasks", only: %i[new create update destroy]
  end

  get "tasks/:id/checkbox", to: "tasks#checkbox", as: "checkbox"

  resources "schedules", only: %i[index new show create edit update destroy]
  resources "notifications", only: %i[destroy]



  # Defines the root path route ("/")
  # root "articles#index"
end
