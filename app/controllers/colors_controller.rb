class ColorsController < ApplicationController
  def create
    @color = Color.create(color_params)
    redirect_to admins_index_path
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to admins_index_path
  end

  private
    def color_params
      params.require(:color).permit(:color)
    end
end
