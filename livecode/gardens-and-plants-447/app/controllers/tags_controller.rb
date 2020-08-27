class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  # page with the form
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
