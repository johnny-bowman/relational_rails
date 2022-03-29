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
    @crag = Crag.create(name: params[:name], year_round: params[:year_round], outhouses: params[:outhouses])
    redirect_to "/crags"
  end

  def update

  end
end
