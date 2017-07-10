class CreateBarcodes < ActiveRecord::Migration[5.1]
  def change
    create_table :barcodes do |t|
      t.string :code
      t.string :description
      t.string :manufacturer

      t.timestamps
    end
  end
end
