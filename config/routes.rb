Rails.application.routes.draw do

  resources :barcodes do
    get 'search', on: :collection
  end

end
