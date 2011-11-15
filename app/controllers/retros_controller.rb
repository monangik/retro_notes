class RetrosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_team
  before_filter :find_team_list, :only => :show
  
  def show
    @retro = @team.retros.find(params[:id])
    @success_notes = @retro.notes.where("note_type = ?", "Success")
    @failure_notes = @retro.notes.where("note_type = ?", "Failure")
  end

  def create
    @retro = @team.retros.build(params[:retro])

    respond_to do |format|
      if @retro.save
        format.html { redirect_to team_path(@team.id), notice: 'Retro was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @retro = Retro.find(params[:id])

    respond_to do |format|
      if @retro.update_attributes(params[:retro])
        format.html { redirect_to @retro, notice: 'Retro was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @retro.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @retro = @team.retros.find(params[:id])
    @retro.destroy

    respond_to do |format|
      format.html { redirect_to team_path(@team.id), notice: 'Retro was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
