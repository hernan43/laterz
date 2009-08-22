class StaticController < ApplicationController
  def index
    if current_user
      # re-direct to user's page
      redirect_to links_path
    end
  end
end
