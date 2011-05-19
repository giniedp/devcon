class SlidesController < ApplicationController

  def show
    @slide_id = params[:id].to_i
    render :template => "slides/slide#{@slide_id}", :layout => false
  end
  
end
