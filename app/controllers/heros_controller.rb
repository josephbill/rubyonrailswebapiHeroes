puts "Loading hero ..."

class HerosController  < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_hero_not_found_response

    def index
        render json: Hero.all, status: :ok
    end

    def show
        hero = find_hero
        render json: hero, serializer: HeroSerializer, status: :ok
      end


      def summary
        hero = Hero.find(params[:id])
        render json: hero, serializer: HeroSummarySerializer
      end


    private

    def find_hero
        Hero.find(params[:id])
    end

    def render_hero_not_found_response
        render json: {error: "Hero not found"}, status: :not_found
    end

end
