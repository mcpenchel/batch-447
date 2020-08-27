class PlantTagsController < ApplicationController

  def create
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant_tag.plant_id = params[:plant_id]

    if @plant_tag.save
      redirect_to garden_path(@plant_tag.plant.garden)
    else
      render 'plants/show'
    end
  end

  private
  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end

end
