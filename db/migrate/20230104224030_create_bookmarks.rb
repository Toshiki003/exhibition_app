class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exhibition, null: false, foreign_key: true

      t.timestamps
      t.index %i[user_id exhibition_id], unique: true
    end
  end
end
