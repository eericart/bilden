class User < ActiveRecord::Base

   require 'digest/md5'

  
    before_save :encrypt_password
   
    validates :email,
    :presence => TRUE,
    :uniqueness => TRUE

    validates :first_name,
    :presence => TRUE,
    :length => {
       :minimum => 2,
       :allow_blank => TRUE
    }

    validates :password,
    :presence => TRUE,
    :length => {
        :minimum => 6,
        :allow_blank => TRUE
    },
    :confirmation => TRUE
    
    validates :password_confirmation,
    :presence => TRUE
    

   
	 def encrypt_password
	    self.password= Digest::MD5.hexdigest(password)
	 end

     def self.validate_login(email, password)
      user = User.find_by_email(email)

      if user && user.password == Digest::MD5.hexdigest(password)
        user
      else
        nil
       end
    end


 end