class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_team_list, :only => :show
	
  def show
  end

end
