Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    root to: 'dashboards#show', as: :admin_root
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'welcome#index'
  end

  get '/dashboard', to: 'dashboard#index'

  resources :users 

end
