class MembersController < ApplicationController
  before_filter :find_group
  
  def create
    old_addresses = @group.members.all
    for email in params[:member][:email].split(/,|;/)
      @group.members.create(:email => email.gsub(/ /,''), :exception => true)
    end
    @new_members = @group.members - old_addresses
  end

  def destroy
    @member = @group.members.find(params[:id])
    @member.destroy
    render :nothing => true
  end
  
  protected 
    def find_group
      @group = Group.find(params[:group_id])
    end

end
