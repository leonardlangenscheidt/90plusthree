class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :week
      t.integer :real_result
      t.integer :league_id
      t.integer :team_id
      t.integer :otherteam_id
      t.boolean :mirror
      t.text :comment

      t.timestamps null: false
    end
  end
end
