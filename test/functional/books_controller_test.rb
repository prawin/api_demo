require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, :user_id => @user, :book => @book.attributes
    end

    assert_redirected_to user_book_path(@user, assigns(:book))
  end

  test "should show book" do
    get :show, :user_id => @user, :id => @book.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @book.to_param
    assert_response :success
  end

  test "should update book" do
    put :update, :user_id => @user, :id => @book.to_param, :book => @book.attributes
    assert_redirected_to user_book_path(@user, assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, :user_id => @user, :id => @book.to_param
    end

    assert_redirected_to user_books_path(@user)
  end
end
