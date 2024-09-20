Rails.application.routes.draw do
  root 'sessions#new'  # Login form at root URL
  post '/login', to: 'sessions#create'  # Handles login submission
  
  resources :students  # RESTful routes for students

  delete 'logout', to: 'sessions#destroy'  # Route for logging out
end
