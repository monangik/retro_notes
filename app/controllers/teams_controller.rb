class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_team_list, :except => [:create, :update, :delete]
  before_filter :find_team_by_id, :except => [:create, :new, :index]  

  def index
    respond_to do |format|
      format.html 
    end
  end

  def show
    @retros = @team.retros
    @team_members = @team.members
    @requested_members = @team.membership_requests

    respond_to do |format|
      format.html
    end
  end

  def new
    @team = Team.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @team = Team.new(params[:team])
    
    respond_to do |format|
      if @team.save
        current_user.teams << @team
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
      else
        format.html { render action: "index" }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
    end
  end
  
  protected    
    def find_team_by_id
      @team = current_user.teams.find(params[:id])
    end
end
