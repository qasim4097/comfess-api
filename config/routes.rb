Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: :auth

  concern :reationable do
    resources :reactions, path: 'reactions/:type', only: [:destroy, :create] do
    end
  end

  namespace :api do
    api_version(module: 'V1', header: { name: 'Accept', value: 'application/vnd.comefess; version=1'}) do
      resources :posts, concerns: :reationable, only: [:create, :index], shallow: true do
        resources :comments, concerns: :reationable, only: [:create]
      end
    end
  end
end
