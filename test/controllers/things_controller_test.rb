require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  setup do
    @thing = things(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:things)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Thing.count') do
      post :create, thing: { name: @thing.name }
    end

    assert_redirected_to thing_path(assigns(:thing))
  end

  def test_show
    get :show, id: @thing
    assert_response :success
  end

  def test_edit
    get :edit, id: @thing
    assert_response :success
  end

  def test_update
    patch :update, id: @thing, thing: { name: @thing.name }
    assert_redirected_to thing_path(assigns(:thing))
  end

  def test_destroy
    assert_difference('Thing.count', -1) do
      delete :destroy, id: @thing
    end

    assert_redirected_to things_path
  end
end
