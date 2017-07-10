class BarcodeSerializer < ActiveModel::Serializer
  attributes :id, :code, :description, :manufacturer, :packaging_info


  def packaging_info
    'TODO'
  end

end