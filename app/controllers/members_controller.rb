class MembersController < ApplicationController
  def create
    find_group
    @member = @group.members.create(params[:member].merge({:exception => true}))
  end

  def destroy
    find_group
    @member = @group.members.find(params[:id])
    @member.destroy
    render :nothing => true
  end
  
  protected 
    def find_group
      @group = Group.find(params[:group_id])
    end

end
