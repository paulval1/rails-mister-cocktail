class DosesController < ApplicationController
  # before_action :set_cocktail

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # now set cocktail foreign key
    @dose.cocktail = @cocktail
    ingredient_id = params[:dose][:ingredient_id]
    @dose.ingredient = Ingredient.find(ingredient_id)

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end
end
