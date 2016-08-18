class PcardsController < ApplicationController

  def create
    @pcard = current_user.pcards.create(pcard_params)
    if @pcard.save
      flash[:notice] = "Successfully created pcard."
      respond_to do |format|
        format.js
      end
    else
       render :json => @pcard.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @pcard = current_user.pcards.find(params[:id])
  end

  def destroy
    @pcard = current_user.pcards.find(params[:id])
    @pcard.destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @pcard = current_user.pcards.find(params[:id])

     if @pcard.update(pcard_params)
       respond_to do |format|
         format.js
       end
     else
       render :json => @pcard.errors, :status => :unprocessable_entity
     end
   end

  private
    def pcard_params
      params.require(:pcard).permit(:amount, :card_id)
    end

end
