Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout', sign_up: 'register'
  }
  resources :portfolios do
    put :sort, on: :collection
  end

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'

  get 'about-me', to: 'pages#about'
  get 'home', to: 'pages#home'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      post :toogle_status
    end
  end

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
