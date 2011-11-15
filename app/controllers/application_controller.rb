class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def find_team_list
      @teams = current_user.teams
    end
    
    def find_team
      @team = current_user.teams.find(params[:team_id])
    end  
end
