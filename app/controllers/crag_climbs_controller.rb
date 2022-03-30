class CragClimbsController < ApplicationController
  def index
    @crag = Crag.find(params[:crag_id])
    if params[:order]
      @climbs = @crag.climbs.sort_alphabetically
    elsif params[:number_of_pitches]
      @climbs = @crag.climbs.sort_by_pitches(params[:number_of_pitches])
    else
      @climbs = @crag.climbs
    end
  end

  def new
    @crag = Crag.find(params[:crag_id])
  end

  def create
    @crag = Crag.find(params[:crag_id])
    @new_climb = @crag.climbs.create!(climb_params)
    redirect_to "/crags/#{@crag.id}/climbs"
  end

  def climb_params
    params.permit(:name, :trad, :pitches)
  end
end
