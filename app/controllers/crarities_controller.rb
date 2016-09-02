class CraritiesController < ApplicationController
  def create
    @crarity = Crarity.create(crarity_params)
    redirect_to admins_index_path
  end

  def destroy
    @crarity = Crarity.find(params[:id])
    @crarity.destroy
    redirect_to admins_index_path
  end

  private
    def crarity_params
      params.require(:crarity).permit(:name)
    end
end
