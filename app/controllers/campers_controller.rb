class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        campers = Camper.all
        render json: campers, each_serializer: CamperwithoutActivitiesSerializer
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create 
        camper = Camper.create!(private_params)
        render json: camper, status: :created, serializer: CamperwithoutActivitiesSerializer
        ## camper.to_json(only: [:id, ;name, :age])- then status created after
    end

    private

    def private_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def unprocessable(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end


end
