class SubtypesController < ApplicationController

  def index
   @subtypes = Subtype.all
 end

 def show
   @subtype = Subtype.friendly.find(params[:id])
   @title = "What #{@subtype.name} cards are in Standard?"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", "%#{@subtype.name}%", "%#{@subtype.name.downcase}%").sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
 end

 def new
   @subtype = Subtype.new
 end

 def edit
   @subtype = Subtype.find(params[:id])
 end

 def create
   @subtype = Subtype.new(subtype_params)

   if @subtype.save
     redirect_to @subtype
   else
     render 'new'
   end
 end

 def update
   @subtype = Subtype.find(params[:id])

   if @subtype.update(subtype_params)
     redirect_to @subtype
   else
     render 'edit'
   end
 end

 def destroy
   @subtype = Subtype.find(params[:id])
   @subtype.destroy

   redirect_to subtypes_path
 end

 private
   def subtype_params
     params.require(:subtype).permit(:name, :title, :description, :url, :conetnt)
   end

end
