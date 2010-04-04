class OwnersController < ApplicationController
  before_filter :find_group
  
  def create
    @owner = @group.owners.create(params[:owner])
  end

  def destroy
    @owner = @group.owners.find(params[:id])
    # @owner.destroy
    respond_to do |wants|
      wants.js do
        render :update do |page|
          page << "$('##{dom_id(@owner)}').fadeOut()"
        end
      end
    end
  end
  
  protected 
    def find_group
      @group = Group.find(params[:group_id])
    end
end
