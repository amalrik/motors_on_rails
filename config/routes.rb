Rails.application.routes.draw do
  get "/models" => "models#index"
  root to: "home#index"
end
