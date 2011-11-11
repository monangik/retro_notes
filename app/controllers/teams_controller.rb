class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_team_list
  

  def index
    @teams = current_user.teams
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  def show
    @team = Team.find(params[:id])
    @retros = @team.retros
    @team_members = @team.members
    @requested_members = @team.membership_requests

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        current_user.teams << @team
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "index" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :ok }
    end
  end
  
  protected
    def find_team_list
      @teams = current_user.teams
    end
end
