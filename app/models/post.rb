class Post < ActiveRecord::Base
  attr_accessible :title, :body, :content, :user_id, :poster_name, :poster_pic
  
  belongs_to :user
end
