class NotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_team
  

  def create
    @retro = @team.retros.find(params[:retro_id])
    @retro_note = @retro.notes.build(params[:note])

    respond_to do |format|
      if @retro_note.save
        format.html { redirect_to retro_path(:id => @retro.id, :team_id => @team.id), notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        
        format.html { redirect_to retro_path(:id => @retro.id, :team_id => @team.id), :flash => { error: "Fill up the form properly." } }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @retro = @team.retros.find(params[:retro_id])
    @retro_note = @retro.notes.find(params[:id])
    @retro_note.destroy

    respond_to do |format|
      format.html { redirect_to retro_path(:id => @retro.id, :team_id => @team.id), notice: 'Note was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
