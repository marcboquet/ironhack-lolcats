class CatsController < ApplicationController

  # Before an action is called, assign the @cat variable
  before_filter :assign_cat, only: [:show, :destroy]
  # We only need it for the show and destroy actions

  def index
    @cats = Cat.all
  end

  # GET /cats/:id
  def show
    # @cat variable is already initialized
  end

  def search
    search_term = params[:name]
    @cats = Cat.where(name: search_term)
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

  # DELETE /cats/:id
  def destroy
    @cat.destroy
    redirect_to cats_url
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
