require 'test_helper'

class IceriksControllerTest < ActionController::TestCase
  setup do
    @icerik = iceriks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iceriks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create icerik" do
    assert_difference('Icerik.count') do
      post :create, icerik: { kod: @icerik.kod, lig: @icerik.lig, mac: @icerik.mac, mbs: @icerik.mbs, oran10: @icerik.oran10, oran11: @icerik.oran11, oran12: @icerik.oran12, oran13: @icerik.oran13, oran14: @icerik.oran14, oran15: @icerik.oran15, oran16: @icerik.oran16, oran17: @icerik.oran17, oran18: @icerik.oran18, oran19: @icerik.oran19, oran1: @icerik.oran1, oran20: @icerik.oran20, oran2: @icerik.oran2, oran3: @icerik.oran3, oran4: @icerik.oran4, oran5: @icerik.oran5, oran6: @icerik.oran6, oran7: @icerik.oran7, oran8: @icerik.oran8, oran9: @icerik.oran9, saat: @icerik.saat }
    end

    assert_redirected_to icerik_path(assigns(:icerik))
  end

  test "should show icerik" do
    get :show, id: @icerik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @icerik
    assert_response :success
  end

  test "should update icerik" do
    patch :update, id: @icerik, icerik: { kod: @icerik.kod, lig: @icerik.lig, mac: @icerik.mac, mbs: @icerik.mbs, oran10: @icerik.oran10, oran11: @icerik.oran11, oran12: @icerik.oran12, oran13: @icerik.oran13, oran14: @icerik.oran14, oran15: @icerik.oran15, oran16: @icerik.oran16, oran17: @icerik.oran17, oran18: @icerik.oran18, oran19: @icerik.oran19, oran1: @icerik.oran1, oran20: @icerik.oran20, oran2: @icerik.oran2, oran3: @icerik.oran3, oran4: @icerik.oran4, oran5: @icerik.oran5, oran6: @icerik.oran6, oran7: @icerik.oran7, oran8: @icerik.oran8, oran9: @icerik.oran9, saat: @icerik.saat }
    assert_redirected_to icerik_path(assigns(:icerik))
  end

  test "should destroy icerik" do
    assert_difference('Icerik.count', -1) do
      delete :destroy, id: @icerik
    end

    assert_redirected_to iceriks_path
  end
end
