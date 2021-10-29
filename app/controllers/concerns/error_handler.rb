module ErrorHandler
  def render_errors(data, status = :unprocessable_entity)
    response = if data.is_a? String
      { message: data }
    else
      { errors: data.errors, message: data.errors.full_messages.join(' / ') }
    end
    render json: response, status: status
  end
end
