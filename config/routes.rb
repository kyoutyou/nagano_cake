Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords],controllers: {
      sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords],controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }
  scope module: :public do
    resources :items,only:[:index,:show]
    resources :customers,only:[:show,:edit,:update,:unsubscibe,:destroy]
    resources :cart_items,only:[:index,:update,:destroy,:destroy_all,:create]
    resources :orders,only:[:new,:confirm,:complete,:create,:index,:show]
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    root to:"homes#top"
    get 'home/about'=>"homes#about", as: "about"
  end


   namespace :admin do
     resources :items
     resources :genres,only:[:index,:create,:edit,:update]
     resources :customers,only:[:index,:show,:edit,:update]
     resources :orders,only:[:show,:update]
     resources :orders_details,only:[:update]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
