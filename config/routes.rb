Rails.application.routes.draw do
  root to: 'pages#home'

  get 'pages/complete', to: 'pages#complete', as: :complete_path

  get   %(find-your-trn/:page), to: %(find_your_trn#edit),   as: :trn_edit
  patch %(find-your-trn/:page), to: %(find_your_trn#update), as: :trn_update
end
