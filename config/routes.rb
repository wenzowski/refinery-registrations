::Refinery::Application.routes.draw do
  resources :parents, only: [:new, :create]
  resources :registrations, only: [:index, :edit, :update] do
    collection do
      get :thank_you
      get :terms_of_agreement
    end
  end
  resources :registration_sessions, only: [:index, :show]
  resources :children, only: [:index, :show]
  resources :child_registrations, only: [:create, :destroy]
  resources :educational_stages, only: [:index, :show]
  resources :fees, only: [:index, :show]

  scope(path: 'refinery', as: 'admin', module: 'admin') do
    resources :registrations, except: :show do
      collection { post :update_positions }
    end
    resources :registration_sessions, except: :show do
      collection { post :update_positions }
    end
    resources :children, except: :show do
      collection { post :update_positions }
    end
    resources :child_registrations, except: :show do
      collection { post :update_positions }
    end
    resources :educational_stages, except: :show do
      collection { post :update_positions }
    end
    resources :fees, except: :show do
      collection { post :update_positions }
    end
  end

end
