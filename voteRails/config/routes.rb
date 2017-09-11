Rails.application.routes.draw do
  get 'admin/adminIndex'

  root 'log_page#index'
  get '/logPage' => 'log_page#index'
  post '/logPage' => 'log_page#create'
  post '/' => 'log_page#create'
  
  get '/voteBallad' => 'log_page#show'
  post '/voteBallad' => 'log_page#castVote'
  
  get '/thankYou' => 'log_page#thanks'
  
  get '/adminLogIn' => 'admin#adminIndex', as: :adminLog
  post '/admin/adminIndex' => 'admin#enter'
  
  get '/admin/panel' => 'admin#panel'
  post '/admin/panel' => 'admin#addDeleteCandidates'
  
  get 'admin/cadetManagement' => 'admin#cadetManagement', as: :adminCadetMan
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
