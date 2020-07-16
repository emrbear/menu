class CartesController < ApplicationController

  def index
  end

  def new
    @carte = Carte.new
  end

end
