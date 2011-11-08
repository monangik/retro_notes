class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def find_team
      @team = Team.find(params[:team_id])
    end
  
end
