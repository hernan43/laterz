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

class UsersController < ApplicationController 
  
  def new  
      @user = User.new  
  end  

  def create  
    @user = User.new(params[:user])  
    @user.save do |result|  
      if result  
        flash[:notice] = "Registration successful."  
        redirect_to root_url  
      else  
        render :action => 'new'  
      end  
    end  
  end
  
  def edit  
    @user = current_user  
  end  

  def update  
    @user = current_user  
    @user.attributes = params[:user]  
    @user.save do |result|  
      if result  
        flash[:notice] = "Successfully updated profile."  
        redirect_to root_url  
      else  
        render :action => 'edit'  
      end  
    end
  end
end
