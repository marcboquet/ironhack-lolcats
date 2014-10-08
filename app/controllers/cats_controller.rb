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
    # Query the DB to get all the cats that match name
    search_term = params[:name]
    if search_term == '' || search_term.nil?
      @cats = []
    else
      @cats = Cat.where('name LIKE ?', "%#{search_term}%")
    end
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
