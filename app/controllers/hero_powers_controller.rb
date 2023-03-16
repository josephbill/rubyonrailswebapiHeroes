class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    def create
      hero_power = HeroPower.create!(hero_power_params)
      render json: hero_power, serializer: HeroPowerSerializer, status: :created
    end
  
    private
  
    def hero_power_params
      params.permit(:strength, :power_id, :hero_id)
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  end


# This is a Ruby on Rails controller called HeroPowerController. 
# It defines a method called create that creates a new HeroPower object with the parameters passed in hero_power_params,
#  and then renders a JSON response with the HeroPowerSerializer.

# The create method also includes a rescue_from block that will catch any ActiveRecord::RecordInvalid 
# exceptions that are raised during the creation of the HeroPower object, and will call the render_unprocessabe_entity_response method
#  to render an error message as a JSON response.

# The private section of the controller includes two helper methods: hero_power_params, which permits specific parameters to be
#  passed in the request, and render_unprocessabe_entity_response, which takes an ActiveRecord::RecordInvalid object and renders
#   a JSON response with the error messages contained within.

# In summary, this controller is responsible for handling requests related to HeroPower objects, and is defining how to create
#  new HeroPower objects and how to handle errors that may arise during that process.
