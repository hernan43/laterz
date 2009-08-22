class LinksController < ApplicationController
  before_filter :require_user
  
  def index
    # this is probably a dumb idea to do it this way
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @links = @category.links
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
    
    respond_to do |format|
      # in case we need to refresh the links list
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @links = @category.links
      else
        @links = current_user.links.no_category
      end
      
      if @link.save
        flash[:notice] = 'Link was successfully created.'
        format.js
        format.html { redirect_back_or_default(links_path) }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.js
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = 'Link was successfully updated.'
        format.html { redirect_back_or_default(links_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = current_user.links.find(params[:id])
    respond_to do |format|
      if @link.destroy
        flash[:notice] = 'Link was deleted.'
        format.js
        format.html { redirect_back_or_default(links_path) }
        format.xml  { head :ok }
      else
        format.js
        format.html { redirect_back_or_default(links_path) }
      end
    end
  end

end
