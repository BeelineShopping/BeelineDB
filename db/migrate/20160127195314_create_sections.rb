class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :aisle, index: true, foreign_key: true
      t.string :section_number

      t.timestamps null: false
    end
  end
end
