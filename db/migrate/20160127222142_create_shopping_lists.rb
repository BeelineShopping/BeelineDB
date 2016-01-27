class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.references :app_user, index: true, foreign_key: true
      t.string :list_title

      t.timestamps null: false
    end
  end
end
