# config/routes.rb
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :producto_tests #se accede a la ruta /api/v1/producto_tests
    end
  end
end
