class OwnersController < ApplicationController
  before_filter :find_group
  
  def create
    @owner = @group.owners.create(params[:owner])
  end

  def destroy
    @owner = @group.owners.find(params[:id])
    @owner.destroy
    render :nothing => true
  end
  
  protected 
    def find_group
      @group = Group.find(params[:group_id])
    end
end
