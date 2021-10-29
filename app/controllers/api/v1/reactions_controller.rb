module Api
  module V1
    class ReactionsController < BaseController
      include Reactionable

      before_action :validate_type
      before_action :set_reaction, only: [:destroy]

      def create
        reaction_service = Reactions::CreateService.new(reaction_params)

        if reaction_service.save
          head :created
        else
          render_errors(reaction_service)
        end
      end

      def destroy
        if @reaction.destroy
          head :no_content
        else
          render_errors(reaction)
        end
      end

      private
        def validate_type
          render_errors('Invalid type', :bad_request) if !Reaction::TYPES_LIST.include?(params[:type])
        end

        def set_reaction
          @reaction = reaction_model(params[:type]).find(params[:id])
        end

        def reaction_params
          params.tap do |whitelisted_params|
            whitelisted_params[:user_id] = current_user.id
          end
        end
    end
  end
end
