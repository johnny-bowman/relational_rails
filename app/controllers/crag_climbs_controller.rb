class CragClimbsController < ApplicationController
  def index
    @crag = Crag.find(params[:crag_id])
    @climbs = @crag.climbs
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
