class AdminUser < ActiveRecord::Base
  attr_accessible :title, :body, :username, :password
  
  validates_presence_of :username
  
  validates_presence_of :password
  validates_uniqueness_of :username
  
  
  def self.authenticate(username="", password="")
     user = AdminUser.find_by_username(username)
     if user && user.password == password
       return user
     else
       return false
     end
   end
  
  
end
