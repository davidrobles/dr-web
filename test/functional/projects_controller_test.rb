require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    @project = projects(:project1)
  end

  test "should show project" do
    get :show, id: @project.slug
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test 'title should be correct' do
    get :show, id: @project.slug
    assert_select 'title', "#{@project.name} | Projects | David Robles"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

end
