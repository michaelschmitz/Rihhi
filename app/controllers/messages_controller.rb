class MessagesController < ApplicationController
  before_filter :login_required # , :except => [:show, :update_add_to_cart]
  # GET /messages
  # GET /messages.xml
  #Called as "Inbox"
  def index
    @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
    @messages.reverse!
     #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.messages.s5")  
    @l2_link = shippingpresets_path 
    @l2_name = t("controllers.messages.s8")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages
  # GET /messages.xml
  #Called as "Inbox"
  def sentmail
    @messages = Message.find(:all, :conditions => ["sender_id = ?", self.current_user])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
  
  # GET /messages/1
  # GET /messages/1.xml
  
  def show
    @message = Message.find(params[:id])
    if !((@message.receiver_id == self.current_user.id) or (@message.sender_id == self.current_user.id))
      logger.info("XXX. Trying to access other users message. User ID " + self.current_user.id.to_s + ".")
      raise
    else
      @messages = Message.find(:all, :conditions => ["receiver_id = ? and sender_id = ? and id != ?", self.current_user, @message.sender_id, @message.id])
      
      if @message.read != "Yes"
        @message.read = "Yes"
        @message.save
      end
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.messages.s5")  
    @l2_link = shippingpresets_path 
    @l2_name = t("controllers.messages.s7")
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @message }
      end    
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
     #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.messages.s5")  
    @l2_link = shippingpresets_path 
    @l2_name = t("controllers.messages.s6")
    if !params[:to_id].blank?
    @receiver = User.find(params[:to_id])
      
    @message.receiver_id = @receiver.id
    @message.receiver_name = @receiver.login
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end
  

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
    #Protect against evil people hacking other peoples mails
     if !((@message.receiver_id == self.current_user.id) or (@message.sender_id == self.current_user.id))
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    end
    
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.sender_id = self.current_user.id
    @user = User.find(self.current_user.id)
    @recipient = User.find(:first, :conditions => ["login = ?", @message.receiver_name])
    if @recipient
    @message.receiver_id = @recipient.id
    end
    @message.sender_name = @user.login
    respond_to do |format|
      if @message.save
        #Send email in correct language to user
        current_language = session[:locale]
        I18n.locale = @recipient.userpage.preferred_language
        SystemMailer.deliver_message(@message, @recipient, @user)
        I18n.locale = current_language
        #End of email
        flash[:notice] = t("controllers.messages.s1") + @message.receiver_name
        format.html { redirect_to messages_path() }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
    if !((@message.receiver_id == self.current_user.id) or (@message.sender_id == self.current_user.id))
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else
      respond_to do |format|
        if @message.update_attributes(params[:message])
          flash[:notice] = 'Message was successfully updated.'
          format.html { redirect_to(@message) }
          format.xml  { head :ok }
        else
          flash[:notice] = 'Error while updating the messsage.'
          format.html { render :action => "edit" }
          format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  

  def mark_as_read
    @message = Message.find(params[:id])
     if !((@message.receiver_id == self.current_user.id) or (@message.sender_id == self.current_user.id))
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else
      @message.read = "Yes"
      
      respond_to do |format|
        if @message.save     
         @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
          format.html { render :partial => "inbox", :object => @messages}
        else
          flash[:notice] = t("controllers.messages.s2")
         @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
          format.html { render :partial => "inbox", :object => @messages}
        end
      end
    end
  end

  def mark_as_unread
    @message = Message.find(params[:id])
     if !((@message.receiver_id == self.current_user.id) or (@message.sender_id == self.current_user.id))
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else
      @message.read = "No"
      
      respond_to do |format|
        if @message.save     
         @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])       
          format.html { render :partial => "inbox", :object => @messages}
        else
          flash[:notice] = 'Error while updating the messsage.'
          @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"]) 
          format.html { render :partial => "inbox", :object => @messages}         
        end
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  # Messages can be archived by the receiver (sender has destroy2)
  def remove
    @message = Message.find(params[:id])
     if !(@message.receiver_id == self.current_user.id)
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else
      @message.receiver_archived = "Yes"
      respond_to do |format|
        if @message.save     
          flash[:notice] = t("controllers.messages.s3")
            @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
            format.html { render :partial => "inbox", :object => @messages }
        else
           @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
          flash[:notice] = t("controllers.messages.s4")
            format.html { render :partial => "inbox", :object => @messages}
            format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        end 
      end  
    end  
 end
 
   def remove_in_show
    @message = Message.find(params[:id])
     if !(@message.receiver_id == self.current_user.id)
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else
      @message.receiver_archived = "Yes"
      respond_to do |format|
        if @message.save     
          flash[:notice] = t("controllers.messages.s3")
            @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
             format.html { redirect_to messages_path() }
        else
           @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
          flash[:notice] = t("controllers.messages.s4")
            format.html { render :partial => "inbox", :object => @messages}
            format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        end 
      end  
    end  
 end

 
   # DELETE /messages/1
  # DELETE /messages/1.xml
  # Messages can be archived by the receiver (sender has destroy2)
  def remove_sent
      @message = Message.find(params[:id])
    if !(@message.sender_id == self.current_user.id)
      logger.info("SPY ATTACK! Someone is looking at other peoples messages! The person is registered: user_id is " + self.current_user.id.to_s + ".")
      raise
    else

      @message.sender_archived = "Yes"
      respond_to do |format|
      if @message.save     
          @messages = Message.find(:all, :conditions => ["sender_id = ? and sender_archived = ?", self.current_user, "No"])
          format.html { render :partial => "sentmail", :object => @messages}
      else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end 
    end
  end
 end
 
 
end
