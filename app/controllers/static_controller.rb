class StaticController < ApplicationController
  def index
    if current_user
      # re-direct to user's page
    end
  end
end
