class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.datetime :ended_at
      t.string :title
      t.text :description
      t.integer :vendor_id
      t.datetime :started_at

      t.timestamps
    end
  end
end
