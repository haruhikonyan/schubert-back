Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    # TODO 絞ったり新しく作ったり
    resources :recruits
    get 'recruits/search-by-canonical/:canonical_model_name/:canonical_id', to: 'recruits#search_by_canonical'
    get 'recruits/team/:team_id', to: 'recruits#recruits_by_team'
    resources :teams
    post 'teams/:id/login', to: 'teams#login'
    resources :concerts
    get 'concerts/team/:team_id', to: 'concerts#concerts_by_team'
    resources :conductors
    resources :holes
    resources :countries
    resources :composers
    resources :tunes
    resources :solists
    resources :types, onry:[:index, :show]
    resources :instruments, onry:[:index, :show]
    resources :instrument_categories, onry:[:index, :show]
    resources :regions, onry:[:index, :show]
    resources :canonical_routes
  end
end
