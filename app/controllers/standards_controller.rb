class StandardsController < ApplicationController
  def create
    @standard = Standard.create(standard_params)
    redirect_to admins_index_path
  end

  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy
    redirect_to admins_index_path
  end

  private
    def standard_params
      params.require(:standard).permit(:name)
    end

end
