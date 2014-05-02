class SystemMailer < ActionMailer::Base
  

  def registered(user)
    subject    I18n.t("models.systemmailer.s1")
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user
  end
  
  def changed_pw(user)
    subject    I18n.t("models.systemmailer.s2")
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user
  end
  
  def changed_pw_security(user, old_email)
    subject    I18n.t("models.systemmailer.s2")
    recipients  old_email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user
  end

  def resend_info(user)
    subject    I18n.t("models.systemmailer.s3")
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user
  end

  def seller(user, seller)
    subject    I18n.t("models.systemmailer.s4")
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller => seller
  end
#User ordered, receives message
  def ordered(user, seller, order, deliverables, shop)
    subject    I18n.t("models.systemmailer.s5")
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller => seller, :order => order, :deliverables => deliverables, :shop => shop
  end
#User ordered, seller receives message
  def sale(user, seller_user, seller, order, deliverables, shop)
    subject    user.login + I18n.t("models.systemmailer.s6") + order.id.to_s + ')'
    recipients seller_user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller => seller, :order => order, :deliverables => deliverables, :shop => shop
  end
#Seller confirms receipt of payment, user receives message
  def sale2(user, seller_user, seller, order, deliverables)
    subject    seller_user.login + I18n.t("models.systemmailer.s7") + order.id.to_s
    recipients user.email
    from       'Rihhi@rihhi.de'
    sent_on    Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller_user => seller_user, :seller => seller, :order => order, :deliverables => deliverables
  end
#Seller confirms shipping, user receives message
  def sale3(user, seller_user, seller, order, deliverables)
    subject     seller_user.login + I18n.t("models.systemmailer.s8")  + order.id.to_s
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller_user => seller_user, :seller => seller, :order => order, :deliverables => deliverables
  end
#Buyer has provided feedback, seller get email notification
  def sale4(user, seller_user, seller, order, rating, deliverables)
    subject     user.login + I18n.t("models.systemmailer.s9")  + order.id.to_s
    recipients  seller_user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller_user => seller_user, :seller => seller, :order => order, :rating => rating, :deliverables => deliverables
  end

#Seller commented on feedback, buyer gets email
  def sale5(user, seller_user, seller, order, rating, sellertext, deliverables)
    subject     seller_user.login + I18n.t("models.systemmailer.s10")  + order.id.to_s
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller_user => seller_user, :seller => seller, :order => order, :rating => rating, :sellertext => sellertext, :deliverables => deliverables
  end

#Movement: Sale complete
  def movement1(order, seller_user, seller)
    subject     I18n.t("models.systemmailer.s11")
    recipients  seller_user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :order => order, :seller => seller, :seller_user => seller_user
  end

#Movement: Account balanced
  def movement2(seller, user, draw)
    subject     I18n.t("models.systemmailer.s12")
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :seller => seller, :user => user, :draw => draw
  end
  
#Movement: Account balancing failure 
  def movement3(seller, user, draw)
    subject     I18n.t("models.systemmailer.s13")
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :seller => seller, :user => user, :draw => draw
  end
#Friend request
    def friend_request(requester, user)
    subject     requester.login + I18n.t("models.systemmailer.s14")
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :requester => requester, :user => user
  end
#Order has been cancelled
    def cancelled(user, seller, order, deliverables)
    subject     user.login + I18n.t("models.systemmailer.s15")
    recipients  user.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :user => user, :seller => seller, :order => order, :deliverables => deliverables
  end

#Message : New message received on Rihhi 
  def message(message, recipient, user)
    subject     I18n.t("models.systemmailer.s16") + " " + user.login 
    recipients  recipient.email
    from        'Rihhi@rihhi.de'
    sent_on     Time.now
    
    body       :greeting => 'Hi,', :message => message, :recipient => recipient, :user => user
  end

end
