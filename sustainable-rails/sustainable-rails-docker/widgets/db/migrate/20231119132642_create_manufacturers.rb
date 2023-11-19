class CreateManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :manufacturers do |t|
      t.text :name
      t.text :address
      t.text :city
      t.text :post_code

      t.timestamps
    end
  end
end
