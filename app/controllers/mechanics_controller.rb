class MechanicsController < ApplicationController
  def index
   @mechanics = Mechanic.all
 end

 def show
   @mechanic = Mechanic.friendly.find(params[:id])
   @title = "What #{@mechanic.name} cards are in Standard?"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", "%#{@mechanic.name}%", "%#{@mechanic.name.downcase}%").sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
 end

 def new
   @mechanic = Mechanic.new
 end

 def edit
   @mechanic = Mechanic.find(params[:id])
 end

 def create
   @mechanic = Mechanic.new(mechanic_params)

   if @mechanic.save
     redirect_to @mechanic
   else
     render 'new'
   end
 end

 def update
   @mechanic = Mechanic.find(params[:id])

   if @mechanic.update(mechanic_params)
     redirect_to @mechanic
   else
     render 'edit'
   end
 end

 def destroy
   @mechanic = Mechanic.find(params[:id])
   @mechanic.destroy

   redirect_to mechanics_path
 end

 private
   def mechanic_params
     params.require(:mechanic).permit(:name, :title, :description, :url, :conetnt)
   end

end
