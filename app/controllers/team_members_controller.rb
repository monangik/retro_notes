class TeamMembersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_team
  before_filter :find_team_list, :only => :index

  def index
    @team_members = @team.members
    @requested_members = @team.membership_requests
  end

  def create
    obj = @team.add_user_with_email(params[:team_member][:email], current_user.id)
    if obj[:error]
      flash[:error] = obj[:error]
    elsif obj[:notice]
      flash[:notice] = obj[:notice]
    end  
    redirect_to team_members_path(:team_id => @team.id)
  end

  def destroy
    @team_member = @team.team_members.find_by_user_id(params[:id])
    raise ActiveRecord::RecordNotFound if @team_member.blank?
    @team_member.destroy
    redirect_to team_members_path(:team_id => @team.id), notice: 'Membership successfully canceled.'
  end  
end
