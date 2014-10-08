class CatsController < ApplicationController

  # Before an action is called, assign the @cat variable
  before_filter :assign_cat, only: [:show] # only the show action

  def index
    @cats = Cat.all
  end

  def show
    # @cat variable is already initialized
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

  # Filtering bad params from a form
  def cat_params
    params.require(:cat).permit(:name, :birth_date)
  end

  def assign_cat
    @cat = Cat.find(params[:id])
  end
end
