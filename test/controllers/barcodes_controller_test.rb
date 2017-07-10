require 'test_helper'

class BarcodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barcode = barcodes(:one)
  end

  test "should get index" do
    get barcodes_url, as: :json
    assert_response :success
  end

  test "should create barcode" do
    assert_difference('Barcode.count') do
      post barcodes_url, params: { barcode: { code: @barcode.code, description: @barcode.description, manufacturer: @barcode.manufacturer } }, as: :json
    end

    assert_response 201
  end

  test "should show barcode" do
    get barcode_url(@barcode), as: :json
    assert_response :success
  end

  test "should update barcode" do
    patch barcode_url(@barcode), params: { barcode: { code: @barcode.code, description: @barcode.description, manufacturer: @barcode.manufacturer } }, as: :json
    assert_response 200
  end

  test "should destroy barcode" do
    assert_difference('Barcode.count', -1) do
      delete barcode_url(@barcode), as: :json
    end

    assert_response 204
  end
end
