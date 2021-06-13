class Api::HealthCheckController < ApplicationController

  def index
    logger.info "============================================================g"
    logger.info "ReuqestUrl: #{request.url}"
    logger.info "============================================================g"
    render json: {status: 200}, status: 200
  end
end
