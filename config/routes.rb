Rails.application.routes.draw do
  resources :divisions do
    resources :employees
  end
  resources :projects
  root to: 'divisions#index'

  # resources :project_name do
  #   post
  # end
end
