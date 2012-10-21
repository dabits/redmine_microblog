class MicroblogsController < ApplicationController
  unloadable
  
  before_filter :authorize_global, :only => [:index, :create, :destroy]
  before_filter :find_project_by_project_id, :authorize, :only => [:index_project, :more_recent_project, :more_history_project]
  
  # GET /microblogs
  # GET /microblogs.json
  def index_project
    @microblogs = Microblog.find_all_by_project_id(@project.id)
    @microblog = Microblog.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs
  # GET /microblogs.json
  def index
    @microblogs = Microblog.visible
    @microblog = Microblog.new
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs
  # GET /microblogs.json
  def more_recent
      @microblogs = Microblog.visible.more_recent(params[:id])
    respond_to do |format|
      format.html { render 'more_recent', :layout => false}# index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs
  # GET /microblogs.json
  def more_history
      @microblogs = Microblog.visible.more_history(params[:id])
    respond_to do |format|
      format.html { render 'more_history', :layout => false}# index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs
  # GET /microblogs.json
  def more_recent_project
      @microblogs = Microblog.visible(@project.id).more_recent(params[:id])
    respond_to do |format|
      format.html { render 'more_recent', :layout => false}# index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs
  # GET /microblogs.json
  def more_history_project
      @microblogs = Microblog.visible(@project.id).more_history(params[:id])
    respond_to do |format|
      format.html { render 'more_history', :layout => false}# index.html.erb
      format.json { render :json => @microblogs }
    end
  end

  # GET /microblogs/1
  # GET /microblogs/1.json
  def show
    @microblog = Microblog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @microblog }
    end
  end

  # POST /microblogs
  # POST /microblogs.json
  def create
    @microblog = Microblog.new(params[:microblog])
    @microblog.user_id = User.current.id

    respond_to do |format|
      if @microblog.save
        format.html { redirect_to :back, :notice =>  l(:microblog_created) }
        format.json { render :json =>  @microblog, :status => :created, :location => @microblog }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @microblog.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  # DELETE /microblogs/1
  # DELETE /microblogs/1.json
  def destroy
    @microblog = Microblog.find(params[:id])
    @microblog.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end