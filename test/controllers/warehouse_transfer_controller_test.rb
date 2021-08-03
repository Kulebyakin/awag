require "test_helper"

class WarehouseTransferControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get warehouse_transfer_new_url
    assert_response :success
  end

  test "should get create" do
    get warehouse_transfer_create_url
    assert_response :success
  end
end
