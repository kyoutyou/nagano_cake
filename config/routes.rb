Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
      sessions: "admin/sessions"
  }

  devise_for :customer, skip: [:passwords],controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }

  scope module: :public do
    root to:"homes#top"
    get 'home/about'=>"homes#about", as: "about"
    get 'orders/complete'=>'orders#complete'
    get 'customers/unsubscribe'=>'customers#unsubscribe'
    delete 'cart_items/destroy_all'=>'cart_items#destroy_all'
    resources :items,only:[:index,:show]
    resource :customers,only:[:show,:edit,:update,:destroy]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :orders,only:[:new,:create,:index,:show] do
      collection do
        post 'confirm'
      end
    end
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end


   namespace :admin do
     root to:"homes#top"
     resources :items
     resources :genres,only:[:index,:create,:edit,:update]
     resources :customers,only:[:index,:show,:edit,:update]
     resources :orders,only:[:show,:update]
     resources :orders_details,only:[:update]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
