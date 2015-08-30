require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address: @user.address, card_id: @user.card_id, email: @user.email, gender: @user.gender, identification_type: @user.identification_type, last_name: @user.last_name, name: @user.name, password: 'some_pass', phone: @user.phone }, 'user_id' => 5
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address: @user.address, card_id: @user.card_id, email: @user.email, gender: @user.gender, identification_type: @user.identification_type, last_name: @user.last_name, name: @user.name, password: 'some_pass', phone: @user.phone }
    assert_redirected_to user_path(assigns(:user).user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
