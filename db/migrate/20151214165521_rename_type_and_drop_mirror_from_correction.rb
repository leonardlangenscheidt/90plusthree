class RenameTypeAndDropMirrorFromCorrection < ActiveRecord::Migration
  def change
  	rename_column :corrections, :type, :typeOfCorrection
  	remove_column :corrections, :mirror
  end
end
