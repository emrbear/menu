class CartesController < ApplicationController

  def index
    @cartes = Carte.by_position
  end

  def new
    @carte = Carte.new
  end

  def create
    @carte = Carte.new( carte_params )
    if @carte.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @carte = Carte.find(params[:id])
  end

  def update
    @carte = Carte.find(params[:id])
    if @carte.update_attributes carte_params
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @carte = Carte.find(params[:id])
    @carte.destroy
    redirect_to action: :index
  end

  def carte_params
    params.require(:carte).permit(:title, :subtitle, :position)
  end

end
