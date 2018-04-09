Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :recruits, except:[:edit]
    post 'recruits/:id/edit', to: 'recruits#edit', as: 'edit_recruit'
  end
end
