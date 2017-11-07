Rails.application.routes.draw do

  get '/seasons' => 'seasons#index'
  get '/seasons/new' => 'seasons#new'
  post '/seasons' => 'seasons#create'
  get '/seasons/:id' => 'seasons#show'
  get '/seasons/:id/edit' => 'seasons#edit'
  patch '/seasons/:id' => 'seasons#update'
  delete '/seasons/:id' => 'seasons#destroy'

  get '/games' => 'games#index'
  get '/games/new/:id' => 'games#new'
  post '/games' => 'games#create'
  get '/games/:id' => 'games#show'
  get '/games/:id/edit' => 'games#edit'
  patch '/games/:id' => 'games#update'
  delete '/games/:id' => 'games#destroy'

  get '/teams' => 'teams#index'
  get '/teams/:id' => 'teams#show'
  get '/teams/:id/edit' => 'teams#edit'
  patch '/teams/:id' => 'teams#update'

  get '/players' => 'players#index'
  get '/players/new' => 'players#new'
  post '/players' => 'players#create'
  get '/players/:id' => 'players#show'
  get '/players/:id/edit' => 'players#edit'
  patch '/players/:id' => 'players#update'
  delete '/players/:id' => 'players#destroy'

  get '/stats' => 'stats#index'
  get '/stats/new/:id' => 'stats#new'
  post '/stats' => 'stats#create'
  get '/stats/:id' => 'stats#show'
  get '/stats/:id/edit' => 'stats#edit'
  patch '/stats/:id/edit' => 'stats#update'
  delete '/stats/:id' => 'stats#destroy'

end
