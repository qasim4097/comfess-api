class Api::V1::BaseController < Api::BaseController
  include ErrorHandler

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found exception
      render_errors("#{exception.message}", :not_found)
    end
end
