Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'bills/fetch' => 'bills#fetch_bills'
  post 'bills/fetchReceipt' => 'bills#fetch_receipt'
  # resources :bills do
  #   collection do
  #     post '/fetch' => 'bills#fetch_bills'
  #     post '/fetchReceipt' => 'bills#fetch_receipt'
  #   end
  # end
end
