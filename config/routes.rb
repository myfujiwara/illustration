Rails.application.routes.draw do
  get '/', to:'posts#top', as: :top
  get '/registration', to:'users#registration', as: :registration
  post '/registration', to:'users#registration_process'
  get '/login', to:'users#login', as: :login
  post '/login', to:'users#login_process'
  get '/upload', to:'posts#upload', as: :upload
  post '/upload', to:'posts#create', as: :create
  get '/manage/illusts', to:'posts#manage', as: :manage
  get '/artworks/{:id}', to:'posts#artworks'
  get '/users/{:id}/follow', to:'users#follow_list', as: :follow_list
  get '/users/{:id}/follower', to:'users#follower_list', as: :follower_list
  get '/users/bookmarks', to:'users#bookmarks'
  get '/users/{:id}', to:'users#profiles'
  get '/setting_profile', to:'users#edit', as: :edit
  post '/setting_profile', to:'users#update', as: :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end