class BarcodeSerializer < ActiveModel::Serializer
  attributes :code, :description, :packaging_info

end