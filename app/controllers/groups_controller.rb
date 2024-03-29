class GroupsController < ApplicationController
  before_filter :find_group, :only => [:show, :edit, :update, :refresh]
  before_filter :find_group_safely, :only => [:edit, :destroy]
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.order(params[:order] || :group_name).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    begin
      if @group.email_query.present?
        flash[:error] = "Your members email query returns no results."  unless Group.connection.select_values(@group.email_query).present?
      end
    rescue ActiveRecord::StatementInvalid
      flash[:error] = "There is an SQL error in your members email query."
    end
    begin
      if @group.owners_email_query.present? 
    	 flash[:error] = "Your owners email query returns no results." unless Group.connection.select_values(@group.owners_email_query).present? 
      end
    rescue ActiveRecord::StatementInvalid
    	flash[:error] = "There is an SQL error in your owners email query."
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    if params[:group_id]
      @old_group = Group.find(params[:group_id])
      @group = Group.new(@old_group.attributes)
    else
      @group = Group.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = current_user.admin? ? Group.find(params[:id]) : current_user.groups.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])
    @group.user = current_user
    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created. Be aware that it may take up to 1 hour for the email addresses to update on the mail server depending on the number of addresses.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  rescue EntityExists
    flash[:error] = "A group or email address with this name already exists. Please come up with a different group email address." 
    respond_to do |wants|
      wants.html { render :action => "new"}
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated. Be aware that it may take up to 1 hour for the email addresses to update on the mail server depending on the number of addresses.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end

  def refresh
    @group.refresh!
    redirect_to :back, :notice => 'Group was successfully updated. Be aware that it may take up to 1 hour for the email addresses to update on the mail server depending on the number of addresses.'
  end
  
  protected
    def find_group
      @group = Group.find(params[:id])
    end
    
    def find_group_safely
      @group = current_user.admin? ? Group.find(params[:id]) : current_user.groups.find(params[:id])
    end
end
