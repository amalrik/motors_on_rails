class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :make_id, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
