Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  
  resources :employees do
    collection {post :import}
    resources :requests, controller: 'employees/requests'#, :except => [:update, :edit]
  end 

  #resources :request_types
  
  get 'about'         =>  'static_pages#about'
  get 'contact'       =>  'static_pages#contact'
  get 'report'       =>  'static_pages#report'
  get 'show_pdf'      =>  'static_pages#show_pdf'
  get 'download_pdf'  =>  'static_pages#download_pdf'
  get 'sign_in'       =>  'devise/sessions#create'
  get 'sign_up'       =>  'devise/sessions#new'
  get 'show_all'      =>  'employees/requests#show_all'
end