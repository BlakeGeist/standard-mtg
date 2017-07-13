class Top50sController < ApplicationController

 def index
   @top50s = Top50.all
 end

end
