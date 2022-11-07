class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Activity.all
    end

    def destroy
        render json: Activity.find(params[:id]).destroy
        head :no_content, status: :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end


    
end
