class LinksController < ApplicationController
  before_filter :require_user
  
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
    else
      @links = current_user.links.no_category
    end
  end
  
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user
    
    if @link.save  
      flash[:notice] = "Link added."  
      redirect_to links_path
    else  
      render :action => 'new'  
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update_attributes(params[:link])  
      flash[:notice] = "Successfully updated link."  
      redirect_to links_path
    else  
      render :action => 'edit'  
    end
  end

  def destroy
    @link = current_user.links.find(params[:id])
    flash[:notice] = "Link deleted."  
    redirect_to :back
  end

end
