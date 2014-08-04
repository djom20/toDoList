class SessionController < ApplicationController

	before_filter :ensure_params_exist
  
  def create
    build_resource
    resource = User.find_for_database_authentication(:login=>params[:user_login][:login])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:user_login][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
  	@user=User.where(:authentication_token=>params[:auth_token]).first
    @user.reset_authentication_token!
    render :json => { :message => ["Session deleted."] },  :success => true, :status => :ok
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end
