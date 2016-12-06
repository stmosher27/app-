class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render json: @cats
  end

  def show
    @cats = Cat.find(:id)
    if @cats
      render json: @cats
    else
      redirect_to cats_url
    end
  end
end
