class CreateLigassos < ActiveRecord::Migration
  def change
    create_table :ligassos, id: false do |t|
      t.belongs_to :league, index: true
      t.belongs_to :team, index: true

      t.timestamps null: false
    end
  end
end
