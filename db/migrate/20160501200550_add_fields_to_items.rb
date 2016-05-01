class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :qty, :string
    add_column :items, :unit, :string
    add_column :items, :name, :string
  end
end
