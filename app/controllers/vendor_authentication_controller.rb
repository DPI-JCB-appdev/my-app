class VendorAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force vendors to sign in before any other actions.
  # skip_before_action(:force_vendor_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def index
    matching_vendors = Vendor.all

    @list_of_vendors = matching_vendors.order({ :created_at => :desc })

    render({ :template => "vendor_authentication/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vendors = Vendor.where({ :id => the_id })

    @the_vendor = matching_vendors.at(0)

    render({ :template => "vendor_authentication/show.html.erb" })
  end

  def sign_in_form
    render({ :template => "vendor_authentication/sign_in.html.erb" })
  end

  def create_cookie
    vendor = Vendor.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if vendor != nil
      are_they_legit = vendor.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/vendor_sign_in", { :alert => "Incorrect password." })
      else
        session[:vendor_id] = vendor.id
      
        redirect_to("/promotions", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/vendor_sign_in", { :alert => "No vendor with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/vendor_sign_in", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "vendor_authentication/sign_up.html.erb" })
  end

  def create
    @vendor = Vendor.new
    @vendor.email = params.fetch("query_email")
    @vendor.password = params.fetch("query_password")
    @vendor.password_confirmation = params.fetch("query_password_confirmation")
    @vendor.name = params.fetch("query_name")
    @vendor.about = params.fetch("query_about")

    save_status = @vendor.save

    if save_status == true
      session[:vendor_id] = @vendor.id
   
      redirect_to("/", { :notice => "Vendor account created successfully."})
    else
      redirect_to("/vendor_sign_up", { :alert => @vendor.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "vendor_authentication/edit_profile.html.erb" })
  end

  def update
    @vendor = @current_vendor
    @vendor.email = params.fetch("query_email")
    @vendor.password = params.fetch("query_password")
    @vendor.password_confirmation = params.fetch("query_password_confirmation")
    @vendor.name = params.fetch("query_name")
    @vendor.about = params.fetch("query_about")
    
    if @vendor.valid?
      @vendor.save

      redirect_to("/", { :notice => "Vendor account updated successfully."})
    else
      render({ :template => "vendor_authentication/edit_profile_with_errors.html.erb" , :alert => @vendor.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_vendor.destroy
    reset_session
    
    redirect_to("/", { :notice => "Vendor account cancelled" })
  end
 
end
