class CreateAisles < ActiveRecord::Migration
  def change
    create_table :aisles do |t|
      t.references :store, index: true, foreign_key: true
      t.string :aisle_number

      t.timestamps null: false
    end
  end
end
