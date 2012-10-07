require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase

  setup do
    @post = posts(:post1)
    @update = {
      title: "This is the title",
      slug: "this-is-the-slug",
      body: "<p>This is the content.</p>"
    }
  end

  ### CREATE ###

  test "should create a post and redirect to post#show" do
    assert_difference 'Post.count' do
      post :create, post: @update
    end
    assert_redirected_to admin_post_path(assigns(:post))
  end

  test "should not create a post with invalid attributes and should render post#new" do
    @update['title'] = ""
    assert_no_difference 'Post.count' do
      post :create, post: @update
    end
    assert_template :new
  end
  
  ### DESTROY ###

  test "should destroy the post" do
    assert_difference 'Post.count', -1 do
      delete :destroy, id: @post.slug
    end
    assert_redirected_to admin_posts_path
  end
  
  ### EDIT ###
  
  test "should respond to edit" do
    get :edit, id: @post.slug
    assert_response :success
    assert_equal @post, assigns(:post)
  end

  ### INDEX ###

  test "should repond to index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  ### NEW ###

  test "should respond to new" do
    get :new
    assert_not_nil assigns(:post)
  end

  ### SHOW ###

  test "should show the post" do
    get :show, id: @post.slug
    assert_response :success
    assert_equal @post, assigns(:post)
  end

  ### UPDATE ###

  test "should update the post and redirect to post#show" do
    new_title = "new_title"
    put :update, id: @post.slug, post: { title: new_title }
    assert_equal new_title, Post.find(@post.id).title
    assert_redirected_to admin_post_path(Post.find(@post.id))
  end

  test "should not update the post and should redirect to post#edit" do
    put :update, id: @post.slug, post: { title: "" }
    assert_equal @post.title, Post.find(@post.id).title
    assert_template :edit
  end

end
