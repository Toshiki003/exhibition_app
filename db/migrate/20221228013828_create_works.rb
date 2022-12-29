class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :work_image
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :exhibition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
