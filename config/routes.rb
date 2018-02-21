Rails.application.routes.draw do
  resources :portfolios, except: %i[show edit]

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'

  get 'about-me', to: 'pages#about'
  get 'pages/home'
  get 'pages/contact'
  
  resources :blogs do
    member do
      post :toogle_status
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
