class AddColumnToOrders < ActiveRecord::Migration
  def self.up
    add_column("free_shipping_orders", "processed", :boolean, :default => false)
  end
  
  def self.down
    remove_column("free_shipping_orders", "processed")
  end
end
