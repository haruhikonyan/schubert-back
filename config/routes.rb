Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    # TODO 絞ったり新しく作ったり
    resources :recruits
    resources :teams

    resources :types, onry:[:index, :show]
    resources :instruments, onry:[:index, :show]
    resources :instrument_categories, onry:[:index, :show]
    resources :regions, onry:[:index, :show]
  end
end
