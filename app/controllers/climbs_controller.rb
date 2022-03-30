class ClimbsController < ApplicationController
  def index
    @climbs = Climb.trad_true?
  end

  def show
    @climb = Climb.find(params[:id])
  end

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @climb = Climb.find(params[:id])
    @climb.update(climb_params)
    redirect_to "/climbs/#{@climb.id}"
  end

  def climb_params
    params.permit(:name, :trad, :pitches)
  end

  def delete
    Climb.destroy(params[:id])
    redirect_to "/climbs"
  end
end
