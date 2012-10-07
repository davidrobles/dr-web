require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  def setup
    @tag = tags(:tag1)
  end

  test 'title should be correct' do
    get :show, id: @tag.slug
    assert_select 'title', "#{@tag.name} | Tags | David Robles"
  end

  test 'should show tag' do
    get :show, id: @tag.slug
    assert_response :success
    assert_not_nil assigns(:tag)
  end

end
