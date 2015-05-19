Rails.application.routes.draw do

  root 'static_pages#home'
  
  resources :employees do
    collection {post :import}
    resources :requests, controller: 'employees/requests' 
  end 
    resources :request_types
  
  get 'about'         =>  'static_pages#about'
  get 'contact'       =>  'static_pages#contact'
  get 'reports'       =>  'static_pages#report'
  get 'show_pdf'      =>  'static_pages#show_pdf'
  get 'download_pdf'  =>  'static_pages#download_pdf'
end