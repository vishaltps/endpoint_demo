Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope :v1 do
      resources :endpoints
    end
  end

  # match "/404", to: "errors#not_found", via: :all

  #This always has to remain at the end of the file
  match '*unmatched_route', to: 'errors#not_found', via: :all
end
