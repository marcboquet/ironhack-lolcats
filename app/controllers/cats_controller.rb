class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    ## Get a new empty cat
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date)
  end
end
