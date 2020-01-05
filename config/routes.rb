Rails.application.routes.draw do
  namespace 'api' do
    resources :people
    resources :locations
    resources :report_people
    resources :trade_items
    resources :reports
  end
end
