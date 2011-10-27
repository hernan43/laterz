#
# This file is part of Laterz.
#
# Laterz is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Laterz is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Laterz.  If not, see <http://www.gnu.org/licenses/>.
#
#

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
    @link.category_id = params[:category_id] if params[:category_id]
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
        format.html {
          if params[:return]
            redirect_to @link.url
          else
            redirect_back_or_default(links_path)
          end
        }
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
      end
    end
  end

end
