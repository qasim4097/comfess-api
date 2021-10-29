module Api
  module V1
    class PostsController < BaseController
      def index
        render json: Post.all
      end

      def create
        post = Post.new(post_params)

        if post.save
          head :created
        else
          render_errors(post)
        end
      end

      private
        def post_params
          params.require(:post).permit(:body).tap do |whitelisted_params|
            whitelisted_params[:user_id] = current_user.id
          end
        end
    end
  end
end
