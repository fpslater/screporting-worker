class HealthcheckController < ApplicationController
  def index
    @special_message = "This is a special message coming from the Healthcheck Controller."
  end

end
