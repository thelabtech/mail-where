class OwnersController < ApplicationController
  before_filter :find_group
  
  def create
    old_addresses = @group.owners.all
    for email in params[:owner][:email].split(/,|;/)
      @group.owners.create(:email => email.gsub(/ /,''), :exception => true)
    end
    @new_owners = @group.owners - old_addresses
  end
  
  def destroy
    @owner = @group.owners.find(params[:id])
    @owner.destroy
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
