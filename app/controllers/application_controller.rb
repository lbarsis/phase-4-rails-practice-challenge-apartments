class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def record_not_found
    render json: {error: "Record not found"}, status: :not_found
  end

  def record_invalid(error)
    render json: {error: error.record.errors.full_messages}
  end

end
