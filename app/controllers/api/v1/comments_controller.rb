module Api
  module V1
    class CommentsController < BaseController
      def create
        comment = Comment.new(comment_params)

        if comment.save
          head :created
        else
          render_errors(comment)
        end
      end

      private
        def comment_params
          params.require(:comment).permit(:body, :parent_id).tap do |whitelisted_params|
            whitelisted_params[:user_id] = current_user.id
            whitelisted_params[:post_id] = params[:post_id]
          end
        end
    end
  end
end
