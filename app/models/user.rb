class User < ActiveRecord::Base
  attr_accessible :title, :body, :username, :password, :email, :picture, :password_confirmation
  
  has_many :posts
  has_one :free_shipping_order
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  # standard validation methods
    validates_presence_of :username
    
    validates_presence_of :password
    
    validates_presence_of :username
    
    validates_uniqueness_of :username
    
    
    # validates_format_of :email, :with => EMAIL_REGEX
    
    validates_confirmation_of :password
    
    
    def self.authenticate(username="", password="")
       user = User.find_by_username(username)
       if user && user.password == password
         return user
       else
         return false
       end
     end
  
end
