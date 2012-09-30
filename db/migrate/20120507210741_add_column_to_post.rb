class AddColumnToPost < ActiveRecord::Migration
  def self.up
    add_column("posts", 'poster_name', :string, :null => false)
    add_column("posts", 'poster_pic', :string)
  end
  
  def self.down
    remove_column("posts", 'poster_pic')
    remove_column("posts", 'poster_name')
  end
end
