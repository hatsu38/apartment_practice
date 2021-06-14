class Api::HealthCheckController < ApplicationController

  def index
    logger.info "============================================================"
    logger.info "ReuqestUrl: #{request.url}"
    Batch::TestJob.perform_async
    render json: {status: 200}, status: 200
  end
end
