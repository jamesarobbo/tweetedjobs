Rails.application.routes.draw do

resources :tweets, only: [:index]

root "tweets#index"

get "/requestlimit", to: "tweets#too_many_requests", as: :too_many_requests

get "*path", to: redirect('/')

end
