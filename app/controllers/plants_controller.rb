class PlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def index
    render json: Plant.all , status: :ok
end
def show
    render json: Plant.find_by(id: params[:id]), status: :ok
end
def create
    render json: Plant.create(plant_params), status: :created
end


private
def render_not_found_response
    render json: {error:"Plant not found"}, status: :not_found
end

def plant_params
    params.permit(:name, :image, :price)
end
end
