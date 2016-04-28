# migration for recipes table
class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.integer :user_id
      t.text :directions
      
      t.timestamps null: false
    end
  end
end
