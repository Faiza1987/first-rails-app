Rails.application.routes.draw do
  # verb 'path', to: 'controller#action'
  # Method  path-URL, to: Controller#action
  # get "/books", to: "books#index", as: "books"

  # get "/books/new", to: "books#new", as: "new_book"
  # post "/books", to: "books#create"  #, as: "create_book"

  # get "/books/:id", to: "books#show", as: "book"

  # get "/books/:id/edit", to: "books#edit", as: "edit_book"
  # patch "/books/:id", to: "books#update"

  # delete "/books/:id", to: "books#destroy"

  # patch "/books/:id/read", to: "books#mark_read", as: "mark_read"
  
  root to: "books#index"
  # only generate the specified routes
  resources :books
  # generates every RESTful route _except_ for POST (create) and DELETE (destroy)
  # resources :authors


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
