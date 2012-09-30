class FreeShippingOrder < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :email, :email_confirmation
  
  belongs_to :user
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates_format_of :email, :with => EMAIL_REGEX
  validates_presence_of :email
  validates_presence_of :user_id
  validates_uniqueness_of :email
  validates_uniqueness_of :user_id
  validates_confirmation_of :email
end
