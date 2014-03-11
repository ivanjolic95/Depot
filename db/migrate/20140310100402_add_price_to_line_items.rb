class AddPriceToLineItems < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |line|
    	line.update_attributes :price => line.product.price
    end
  end

  def down
  	remove_column :line_items, :price
  end
end
