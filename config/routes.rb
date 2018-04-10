Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    resources :recruits, except:[:edit]
    post 'recruits/:id/edit', to: 'recruits#edit', as: 'edit_recruit'
    resources :types, onry:[:index, :show]
  end
end
