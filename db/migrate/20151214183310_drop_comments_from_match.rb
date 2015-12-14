class DropCommentsFromMatch < ActiveRecord::Migration
  def change
  	remove_column :matches, :comment
  end
end
