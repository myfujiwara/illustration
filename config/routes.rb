Rails.application.routes.draw do
  get '/', to:'posts#top', as: :top
  get '/registration', to:'users#registration', as: :registration
  post '/registration', to:'users#registration_process'
  get '/login', to:'users#login', as: :login
  post '/login', to:'users#login_process'
  get '/upload', to:'posts#upload', as: :upload
  post '/upload', to:'posts#create', as: :create_illstration
  get '/upload/novel', to:'posts#upload_novel', as: :upload_novel
  post '/upload/novel', to:'posts#create_novel', as: :create_novel
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end