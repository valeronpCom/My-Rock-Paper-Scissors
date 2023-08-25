Rails.application.routes.draw do
  root 'game#index'
  post '/play', to: 'game#play'
  get '/result', to: 'game#result', as: 'result'
end
