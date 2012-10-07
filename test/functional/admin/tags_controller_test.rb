require 'test_helper'

class Admin::TagsControllerTest < ActionController::TestCase

  setup do
    @tag = tags(:tag1)
    @update = {
      name: "This is the name",
      slug: "this-is-the-slug"
    }
  end

  ### CREATE ###

  test "should create a tag and redirect to tag#show" do
    assert_difference 'Tag.count' do
      post :create, tag: @update
    end
    assert_redirected_to admin_tag_path(assigns(:tag))
  end

  test "should not create a tag with invalid attributes and should render tag#new" do
    @update['name'] = ""
    assert_no_difference 'Tag.count' do
      post :create, tag: @update
    end
    assert_template :new
  end
  
  ### DESTROY ###

  test "should destroy the tag" do
    assert_difference 'Tag.count', -1 do
      delete :destroy, id: @tag.slug
    end
    assert_redirected_to admin_tags_path
  end
  
  ### EDIT ###
  
  test "should respond to edit" do
    get :edit, id: @tag.slug
    assert_response :success
    assert_equal @tag, assigns(:tag)
  end

  ### INDEX ###

  test "should repond to index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  ### NEW ###

  test "should respond to new" do
    get :new
    assert_not_nil assigns(:tag)
  end

  ### SHOW ###

  test "should show the tag" do
    get :show, id: @tag.slug
    assert_response :success
    assert_equal @tag, assigns(:tag)
  end

  ### UPDATE ###

  test "should update the tag and redirect to tag#show" do
    new_name = "new_name"
    put :update, id: @tag.slug, tag: { name: new_name }
    assert_equal new_name, Tag.find(@tag.id).name
    assert_redirected_to admin_tag_path(Tag.find(@tag.id))
  end

  test "should not update the tag and should redirect to tag#edit" do
    put :update, id: @tag.slug, tag: { name: "" }
    assert_equal @tag.name, Tag.find(@tag.id).name
    assert_template :edit
  end

end
