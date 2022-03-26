class CragClimbsController < ApplicationController
  def index
    crag = Crag.find(params[:crag_id])
    @climbs = crag.climbs
  end
end
