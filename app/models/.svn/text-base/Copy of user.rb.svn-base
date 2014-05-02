require 'digest/sha1'
class User < ActiveRecord::Base
  has_one :seller
  has_many :lists
  has_many :orders
  has_many :favorites, :dependent => :destroy
  has_many :hearteds, :dependent => :destroy
  has_many :flaggeds, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :ratings
  has_many :events
  has_many :ticketorders
  has_one :userpage
  has_many :friends
    

  
  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login, :email, :message => I18n.t("models.user.s1")
  validates_presence_of     :password,                   :if => :password_required?, :message => I18n.t("models.user.s1")
  validates_presence_of     :password_confirmation,      :if => :password_required?, :message => I18n.t("models.user.s1")
  validates_length_of       :password, :within => 6..40, :if => :password_required?, :message => I18n.t("models.user.s2")
  validates_confirmation_of :password,                   :if => :password_required?, :message => I18n.t("models.user.s3")
  validates_length_of       :login,    :within => 3..40, :if => :login?, :message => I18n.t("models.user.s4")
  validates_length_of       :email,    :within => 5..100,:if => :email?
  validates_format_of       :email,    :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
                                       :message => I18n.t("models.user.s5")
  

  validates_uniqueness_of   :login, :case_sensitive => false, :message => I18n.t("models.user.s6")
  #validates_uniqueness_of  :email, :case_sensitive => false, :message => "Has already been used."
  before_save :encrypt_password
  
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation, :friends_visible

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    
end
