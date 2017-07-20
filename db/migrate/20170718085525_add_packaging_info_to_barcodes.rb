class AddPackagingInfoToBarcodes < ActiveRecord::Migration[5.1]
  def change
    add_column :barcodes, :packaging_info, :string
  end
end
