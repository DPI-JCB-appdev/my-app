Rails.application.routes.draw do



  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Vendor account:

  # SIGN UP FORM
  get("/vendor_sign_up", { :controller => "vendor_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_vendor", { :controller => "vendor_authentication", :action => "create"  })

  # READ
  get("/vendors", { :controller => "vendor_authentication", :action => "index" })

  get("/vendors/:path_id", { :controller => "vendor_authentication", :action => "show" })
      
  # EDIT PROFILE FORM        
  get("/edit_vendor_profile", { :controller => "vendor_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_vendor", { :controller => "vendor_authentication", :action => "update" })

  
  # DELETE RECORD
  get("/cancel_vendor_account", { :controller => "vendor_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/vendor_sign_in", { :controller => "vendor_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/vendor_verify_credentials", { :controller => "vendor_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/vendor_sign_out", { :controller => "vendor_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Promotion resource:

  # CREATE
  post("/insert_promotion", { :controller => "promotions", :action => "create" })
          
  # READ
  get("/promotions", { :controller => "promotions", :action => "index" })
  
  get("/promotions/:path_id", { :controller => "promotions", :action => "show" })
  
  # UPDATE
  
  post("/modify_promotion/:path_id", { :controller => "promotions", :action => "update" })
  
  # DELETE
  get("/delete_promotion/:path_id", { :controller => "promotions", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
