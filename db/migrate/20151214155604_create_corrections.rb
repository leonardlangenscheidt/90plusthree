class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|
      t.string :name
      t.string :link
      t.integer :match_id
      t.integer :type
      t.integer :change
      t.integer :minute
      t.boolean :mirror

      t.timestamps null: false
    end
  end
end
