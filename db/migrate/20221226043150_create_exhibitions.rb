class CreateExhibitions < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibitions do |t|
      t.string :title, null: false
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.integer :status,default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
