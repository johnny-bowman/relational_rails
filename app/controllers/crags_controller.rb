class CragsController < ApplicationController
  def index
    @crags = Crag.order(created_at: :asc)
  end

  def show
    @crag = Crag.find(params[:id])
  end
end
