class CreateCorrectassos < ActiveRecord::Migration
  def change
    create_table :correctassos, id: false do |t|
    	t.belongs_to :match, index: true
      	t.belongs_to :correction, index: true
      	t.timestamps null: false
    end
  end
end
