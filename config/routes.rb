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
  get '/users/{:id}/follow', to:'users#follow'
  get '/users/bookmarks', to:'users#bookmarks'
  get '/users/{:id}/followers', to:'users#followers'
  get '/users/{:id}', to:'users#profiles'
  get '/setting_profile', to:'users#setting'
  post '/setting_profile', to:'users#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end