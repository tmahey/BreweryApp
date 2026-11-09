class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all

    # Simple search by name
    if params[:search].present?
      @breweries = @breweries.where("name LIKE ?", "%#{params[:search]}%")
    end

    # Hierarchical search by state dropdown
    if params[:state_id].present?
      @breweries = @breweries.where(state_id: params[:state_id])
    end

    @breweries = @breweries.page(params[:page]).per(25)
  end
end
