class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quanty, :integer, default: 1
  end
end
