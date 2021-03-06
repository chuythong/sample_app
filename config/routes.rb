SampleApp::Application.routes.draw do

  resources :users do
    member do
      get :following, :followers
      # URI                 Action      Named route          
      # ---                 ------      -----------          
      # /users/1/following  following   following_user_path(1)
      # /users/1/followers  followers   followers_user_path(1)
    end

  end
  # resources :users
  # URI				    Action  Named route				   Purpose
  # ---				    ------	-----------				   -------
  # /users			  index	  users_path				   page to list all users
  # /users/1		  show	  user_path(user)			 page to show user
  #	/users/new		new		  new_user_path			   page to make a new user (signup)
  #	/users			  create	users_path				   create a new user
  #	/users/1/edit	edit	  edit_user_path(user) page to edit user with id 1
  #	/users/1		  update	user_path(user)			 update user
  #	/users/1		  destroy	user_path(user)			 delete user
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root to: "static_pages#home"

  # get "static_pages/help"
  # get "static_pages/about"
  # get "static_pages/contact" 

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end
