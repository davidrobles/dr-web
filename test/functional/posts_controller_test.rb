require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @post = posts(:post1)
  end
  
  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should show 6 posts per page' do
    get :index
    assert_select '.post', 6
  end

  test 'title should be correct' do
    get :show, id: @post.slug
    assert_select 'title', "#{@post.title} | Blog | David Robles"
  end

  test 'should show post' do
    get :show, id: @post.slug
    assert_response :success
    assert_not_nil assigns(:post)
  end

end
