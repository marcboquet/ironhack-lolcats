class CatsController < ApplicationController
  def index
  end

  def show
  end

  def new
    ## Get a new empty cat
    @cat = Cat.new
  end

  def create
  end
end
