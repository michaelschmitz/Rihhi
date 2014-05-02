class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
 
  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "You account has been activated. Signup is complete."
    end
    redirect_back_or_default('/')
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    reset_session
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :attribute => "capta")
      if @user.save && @user.errors.empty?
        @user.friends_visible == "Yes"
        @userpage = Userpage.new
        @userpage.about_me = ""
        @userpage.about_me_p = "No"
        @userpage.status_p = "No"
        @userpage.real_name_p = "No"
        @userpage.homepage_p = "No"
        @userpage.region_p = "No"
        @userpage.larp_setting_p = "No"
        @userpage.larp_philosophy_p = "No"
        @userpage.favorite_characters_p = "No"
        @userpage.player_group_p = "No"
        @userpage.homepage_of_group_p = "No"
        @userpage.relationship_p = "No"
        @userpage.looking_for_p = "No"
        @userpage.contact_me_p = "No"
        @userpage.future_const_p = "No"
        @userpage.last_cons_p = "No"
        @userpage.ask_me_about_p = "No"
        @userpage.music_p = "No"
        @userpage.books_p = "No"
        @userpage.movies_p = "No"
        @userpage.other_hobbies_p = "No"
        @userpage.what_if_p = "No"
        @userpage.user_id = @user.id
        @userpage.preferred_language = I18n.locale.to_s
        @userpage.save
        self.current_user = @user
        redirect_back_or_default('/')
        flash[:notice] = "Welcome on Rihhi. You received an email that details how to activate this account."
      else
      render :action => 'new'
      end
    else
    render :action => 'new'      
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(self.current_user.id)
        #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.users.s5")
    @l2_link = ""
    @l2_name = t("controllers.users.s6")
  end
  
  def edit1
    @user = User.find(self.current_user.id)
  end


  def forgot
    @user = User.new
  end
  
  # render new.rhtml
  def new
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.users.s9")
    @l2_link = ""
    @l2_name = t("controllers.users.s10")
  end

  
    def resend_info
    begin
      @user = User.find(:first, :conditions => ["email = ?", params[:user][:email]])
      @user.password = "1" + rand(9).to_s + rand(9).to_s + rand(9).to_s + rand(9).to_s + rand(9).to_s + rand(9).to_s
      @user.password_confirmation = @user.password
    rescue
      redirect_to new_session_path
      flash[:notice_bad] = t("controllers.users.s1")
    else
      if @user.save
        SystemMailer.deliver_resend_info(@user)
        flash[:notice] = t("controllers.users.s2")
      else
        flash[:notice_bad] = t("controllers.users.s3")
      end
      redirect_to new_session_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    @userpage = Userpage.find(:first, :conditions => ["user_id = ?", @user.id])
    @friend = Friend.new
    
    #Find people who I have asked to be my friend - show their name
    @friends_i_asked = Friend.find(:all, :conditions => ["user_id = ? and status = ?", @user.id, "accepted"], :limit => 6)
    #Find people that have asked me to be their friend - show their name  
    @friends_who_asked_me = Friend.find(:all, :conditions => ["friend_id = ? and status = ?", @user.id, "accepted"], :limit => 6)
    
    #Check whether this guy is my friend already
    @already = 0
    if logged_in?
      @friends_i_asked.each do |f|
        if f.friend_id == self.current_user.id
          @already = 1
        end
      end
      @friends_who_asked_me.each do |f|
        if f.user_id == self.current_user.id
          @already = 1
        end
      end
    end
    
    #All people who requests me
    @friend_request = Friend.find(:all, :conditions => ["friend_id = ? and status = ?", @user.id, "requested"])
    
    if logged_in?
    #I request him
    #Did visitor request user?
    @visitor_friend_request = Friend.exists?(["user_id = ? and friend_id = ? and status = ?", self.current_user.id, @user.id, "requested"])
    #Did User request visitor?    
    @user_friend_request = Friend.exists?(["user_id = ? and friend_id = ?  and status = ?", @user.id, self.current_user.id, "requested"])
      if @visitor_friend_request 
        @he_requested = 1
      elsif @user_friend_request
        @i_requested = 1
      end  
    logger.info @user_friend_request.inspect
    logger.info @visitor_friend_request.inspect
    end    
  
    
    #Define breadcrumbs
    @l1_link = user_path(@user)
    @l1_name = t("controllers.users.s9")    
    @l2_link = session_path 
    @l2_name = @user.login
  end
  
      # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(self.current_user.id)
    @old_email = @user.email
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        #if new email address
        if @old_email != @user.email
          SystemMailer.deliver_changed_pw_security(@user, @old_email)   #Send a copy of the changes to the old email address
          SystemMailer.deliver_changed_pw(@user)                        #Send the data to the new email address
        elsif @old_pw != @user.password
          SystemMailer.deliver_changed_pw(@user)                        #Always sends email - only way to avoid is compare old with new hash of pw.
        end

        flash[:notice] = t("controllers.users.s7")
        format.html { redirect_to profile_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update1
    @user = User.find(self.current_user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = t("controllers.users.s8")
        format.html { redirect_to user_path() }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit1" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
