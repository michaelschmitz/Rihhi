class FriendsController < ApplicationController
  before_filter :login_required, :except => [:show]
  # GET /friends
  # GET /friends.xml
  def index
    @friends = Friend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.xml
  def show
    @user = User.find(params[:id])
    #Find people who I have asked to be my friend - show their name
    @friends_i_asked = Friend.find(:all, :conditions => ["user_id = ? and status = ?", @user.id, "accepted"], :limit => 6)
    #Find people that have asked me to be their friend - show their name  
    @friends_who_asked_me = Friend.find(:all, :conditions => ["friend_id = ? and status = ?", @user.id, "accepted"], :limit => 6)
    #If the user is not showing friends to the public, then already = 0 and we do not show his friends
    @already = 1
    if @user.friends_visible == "No"
      @already = 0
      #Check is it me?
      if logged_in?
        if self.current_user.id == @user.id
          @already = 1
        end 
        #Check whether its a friend
        @friends_i_asked.each do |f|
          if f.user_id == self.current_user.id
            @already = 1
          end
        end
        @friends_who_asked_me.each do |f|
          if f.friend_id == self.current_user.id
            @already = 1
          end
        end
      end
    end

    #Define breadcrumbs
    @l1_link = user_path(@user.id)
    @l1_name = @user.login
    @l2_link = ""
    @l2_name = @user.login + '\'s Friends'
    respond_to do |format|
      if @already == 1
        format.html # new.html.erb
      else
        flash[:notice_bad] = t("controllers.friends.s4")
        format.html { redirect_to site_path()  }
     end
    end
  end

  # GET /friends/new
  # GET /friends/new.xml
  def new
    @friend = Friend.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.xml
  def create
    @friend = Friend.new(params[:friend])
    @friend.status = "requested"
    @requester = self.current_user
    @user = User.find(:first, :conditions => ["id = ?", @friend.friend_id])
    #Send email to person
    SystemMailer.deliver_friend_request(@requester, @user)
    
    
    @user = User.find(self.current_user.id)
    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@user, :notice => 'Friend request sent.') }
        format.xml  { render :xml => @friend, :status => :created, :location => @friend }
      else
        format.html { redirect_to(@user, :notice_bad => 'Friend request could not be sent.') }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.xml
  def update
    @friend = Friend.find(params[:id])
    
    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to(@friend, :notice => 'Friend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update1
    @friend = Friend.find(params[:id])
    @friend.status = "accepted"
    @user = User.find(self.current_user.id)
    
    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@user, :notice => t("controllers.friends.s1")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update2
    @friend = Friend.find(params[:id])
    @friend.status = "ignored"
    @user = User.find(self.current_user.id)
    
    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@user, :notice => t("controllers.friends.s2")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
  # DELETE /friends/1
  # DELETE /friends/1.xml
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end
end
