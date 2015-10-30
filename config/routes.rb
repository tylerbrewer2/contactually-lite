Rails.application.routes.draw do
  
  root 'users#new'

  resources :users do
    resources :contacts
  end

  delete '/users/contacts/:id', to: 'contacts#destroy', as: 'destroy_contact'
end
