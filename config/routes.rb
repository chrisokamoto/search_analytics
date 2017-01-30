Rails.application.routes.draw do
  root to: 'search_analytics#index'

  resources :search_analytics
  post 'save_search', to: "search_analytics#save_search", as: "save_search"
  get 'show_search_analytics', to: "search_analytics#show_search_analytics", as: "show_search_analytics"
end
