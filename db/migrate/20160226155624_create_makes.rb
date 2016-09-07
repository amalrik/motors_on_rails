class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :name
      t.integer :webmotors_id, index: true
      t.integer :maker_count

      t.timestamps null: false
    end
  end
end
