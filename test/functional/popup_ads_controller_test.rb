require 'test_helper'

class PopupAdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:popup_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create popup_ad" do
    assert_difference('PopupAd.count') do
      post :create, :popup_ad => { }
    end

    assert_redirected_to popup_ad_path(assigns(:popup_ad))
  end

  test "should show popup_ad" do
    get :show, :id => popup_ads(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => popup_ads(:one).to_param
    assert_response :success
  end

  test "should update popup_ad" do
    put :update, :id => popup_ads(:one).to_param, :popup_ad => { }
    assert_redirected_to popup_ad_path(assigns(:popup_ad))
  end

  test "should destroy popup_ad" do
    assert_difference('PopupAd.count', -1) do
      delete :destroy, :id => popup_ads(:one).to_param
    end

    assert_redirected_to popup_ads_path
  end
end
