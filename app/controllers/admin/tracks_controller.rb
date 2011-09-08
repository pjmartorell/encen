class Admin::TracksController < Admin::AdminController

  # GET /tracks
  # GET /tracks.xml
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.xml
  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.xml
  def new
    @track = Track.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
    @album = Album.find(params[:album_id])
    
  end

  # POST /tracks
  # POST /tracks.xml
  def create
    @track = Track.new(params[:track])
    @album = Album.find(params[:album_id])
    
    @track.album = @album
        
    respond_to do |format|
      if @track.save
        format.html { redirect_to([:admin, @album], :notice => 'Track was successfully created.') }
        format.xml  { render :xml => @track, :status => :created, :location => @track }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.xml
  def update
    @track = Track.find(params[:id])
    @album = Album.find(params[:album_id])

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to([:admin, @album], :notice => 'Track was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.xml
  def destroy
    @track = Track.find(params[:id])
    @album = Album.find(params[:album_id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to(admin_album_url(@album)) }
      format.xml  { head :ok }
    end
  end
end
