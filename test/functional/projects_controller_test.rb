require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    @project = projects(:project1)
  end

  test "should show project" do
    get :show, :id => @project.id
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
  
end
