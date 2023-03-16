puts "Loading powers ..."
class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_power_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessabe_entity_response
   def index
    powers = Power.all
    render json: powers, each_serializer: PowerSerializer, status: :ok
  end

    def show
        power = find_power
        render json: power, status: :ok
    end

    def update
        power = find_power
        power.update!(power_params)
        render json: power, status: :created
    end


    private

    def find_power
        Power.find(params[:id])
    end
    
    def power_params
        params.permit(:description)
    end

    def render_power_not_found_response
        render json: {error: "Power not found"}, status: :not_found
    end

    def render_unprocessabe_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
