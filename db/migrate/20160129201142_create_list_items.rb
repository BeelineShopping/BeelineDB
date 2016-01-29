class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :shopping_list, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
