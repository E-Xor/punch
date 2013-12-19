class ClocksController < ApplicationController

  def entrance
    # Just renders entrance form
  end

  def inout
    Rails.logger.debug "InOut params: #{params.inspect}"
  end

end
