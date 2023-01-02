Rails.application.routes.draw do
  post "/produces", to: "produces#produce"
end
