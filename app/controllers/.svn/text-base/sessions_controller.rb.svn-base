# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
  begin
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_to profile_path()
      flash[:notice] = "Logged in successfully"
    else
      u = User.find(:first, :conditions => ["login = ?", params[:login]])
      if u == nil
        flash[:notice] = "Login does not exist." 
      elsif u != nil
        if u.activated_at == nil
          flash[:notice] = "Your account has not been activated yet. Check your emails."  
        else
          flash[:notice] = "Password was wrong"    
        end
      end
      render :action => 'new'
    end
  rescue
    logger.info "XXX. Failure in session create."
    render :action => 'new'
  else
  end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
