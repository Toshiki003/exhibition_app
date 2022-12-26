class CreateExhibitions < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibitions do |t|
      t.string :title, null: false
      t.string :description
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
