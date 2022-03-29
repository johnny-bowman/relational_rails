class CragsController < ApplicationController
  def index
    @crags = Crag.order(created_at: :asc)
  end

  def show
    @crag = Crag.find(params[:id])
  end

  def new

  end

  def create
    @crag = Crag.create(crag_params)
    redirect_to "/crags"
  end

  def edit
    @crag = Crag.find(params[:crag_id])
  end

  def crag_params
    params.permit(:name, :outhouses, :year_round)
  end

  def update
    crag = Crag.find(params[:crag_id])
    crag.update(crag_params)
    redirect_to "/crags/#{crag.id}"
  end
end
