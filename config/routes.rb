Rails.application.routes.draw do

  root 'admin#index', as: 'admin_index'

  #Create new user-login (already logged in)
  get 'user/index', to: 'user#index', as: 'user_cre'
  post 'user/create', to: 'user#create'

  #Redirect sign_up to login
  devise_scope :user do
    get "users/sign_up", :to => "devise/sessions#new", :as => :sign_in
  end

  #Devise login, recall paths
  devise_for :users,:path_names => {
    :sign_in  => 'login',
    :sign_up  => 'sign_up' #User.create!({:email => "example@gmail.com", :password => "example" })
  }

#GET
  #admin
  #get 'admin/index', to: 'admin#index', as: 'admin'
  get 'admin/:id/edit', to: 'admin#edit', as: 'edit_admin'
  get 'admin/:id/destroy', to: 'admin#destroy', as: 'delete_admin'
  #create post
  post 'admin', to: 'admin#create'
  #edit patch
  patch 'admin/:id', to: 'admin#update'
  #gallery
  get 'gallery/index', to: 'gallery#index', as: 'gallery'

end
