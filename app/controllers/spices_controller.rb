class SpicesController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def show
        render json: Spice.all, status: 200
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice,status: :created
    end
    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice,status: 202
    end
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end
    private
    def spice_params
        params.permit(:id,:title,:image,:description,:notes,:rating)
    end
    def render_not_found
        render json: {"error":"spice not found"},status: :not_found
    end
end
