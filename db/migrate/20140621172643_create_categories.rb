class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :name, null: false

      t.timestamps
    end
  end
end
