class CreateFreeShippingOrders < ActiveRecord::Migration
  def change
    create_table :free_shipping_orders do |t|
      t.integer "user_id", :null => false
      t.string "email", :null => false
      t.timestamps
    end
  end
end
