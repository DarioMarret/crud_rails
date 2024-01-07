
module Api
  module V1
    #El nombre del controlador debe ser en plural y la clase se debe llamar igual que el controlador pero en singular
    class ProductoTestsController < ApplicationController
        # before_action :set_producto_test, only: [:show, :create, :update, :destroy]
        skip_before_action :verify_authenticity_token

        # GET /producto_tests
        def index
            begin
                @producto_tests = ProductoTest.all
                render json: {status: 'SUCCESS', message:'Loaded producto_tests', data:@producto_tests},status: :ok
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message:'producto_tests not found', data:e},status: :unprocessable_entity
            end
        end

        # GET /producto_tests/1
        def show
            begin
                @producto_test = ProductoTest.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded producto_test', data:@producto_test}
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message:'producto_test not found', data:e},status: :unprocessable_entity
            end
        end

        # POST /producto_tests
        def create
            begin
                producto_test = ProductoTest.new(producto_params)
                if producto_test.save
                    render json: {status: 'SUCCESS', message:'Saved producto_test', data:producto_test},status: :ok
                else
                    render json: { errors: producto_test.errors }, status: :unprocessable_entity
                end
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message:'producto_test not saved', data:e},status: :unprocessable_entity
            end
        end

        # PATCH/PUT /producto_tests/1
        def update
            begin
                producto_update = ProductoTest.find(params[:id])
                if producto_update.update(producto_params)
                    render json: {status: 'SUCCESS', message:'Updated producto_test', data:producto_update},status: :ok
                else
                    render json: {status: 'ERROR', message:'producto_test not updated', data:producto_update.errors},status: :unprocessable_entity
                end
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message:'producto_test not found', data:e},status: :unprocessable_entity
            end
        end

        # DELETE /producto_tests/1
        def destroy
            begin
                producto_delete = ProductoTest.find(params[:id])
                if producto_delete.destroy
                    render json: {status: 'SUCCESS', message:'Deleted producto_delete', data:producto_delete},status: :ok
                else
                    render json: {status: 'ERROR', message:'producto_delete not deleted', data:producto_delete.errors},status: :unprocessable_entity
                end
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message:'producto_delete not found', data:e},status: :unprocessable_entity
            end
        end
    
        private

        def producto_params
            params.permit(:name, :description, :price)
        end

        def set_producto_test
            producto_test = ProductoTest.find(params[:id])
            return producto_test
        end

    end
  end
end