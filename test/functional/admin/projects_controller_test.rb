require 'test_helper'

class Admin::ProjectsControllerTest < ActionController::TestCase

  setup do
    @project = projects(:project1)
    @update = {
      name: "This is the name",
      slug: "this-is-the-slug",
      body: "<p>This is the content.</p>"
    }
  end

  ### CREATE ###

  test "should create a project and redirect to project#show" do
    assert_difference 'Project.count' do
      post :create, project: @update
    end
    assert_redirected_to admin_project_path(assigns(:project))
  end

  test "should not create a project with invalid attributes and should render project#new" do
    @update['name'] = ""
    assert_no_difference 'Project.count' do
      post :create, project: @update
    end
    assert_template :new
  end
  
  ### DESTROY ###

  test "should destroy the project" do
    assert_difference 'Project.count', -1 do
      delete :destroy, id: @project.slug
    end
    assert_redirected_to admin_projects_path
  end
  
  ### EDIT ###
  
  test "should respond to edit" do
    get :edit, id: @project.slug
    assert_response :success
    assert_equal @project, assigns(:project)
  end

  ### INDEX ###

  test "should repond to index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  ### NEW ###

  test "should respond to new" do
    get :new
    assert_not_nil assigns(:project)
  end

  ### SHOW ###

  test "should show the project" do
    get :show, id: @project.slug
    assert_response :success
    assert_equal @project, assigns(:project)
  end

  ### UPDATE ###

  test "should update the project and redirect to project#show" do
    new_name = "new_name"
    put :update, id: @project, project: { name: new_name }
    assert_equal new_name, Project.find(@project.id).name
    assert_redirected_to admin_project_path(Project.find(@project.id))
  end

  test "should not update the project and should redirect to project#edit" do
    put :update, id: @project, project: { name: "" }
    assert_equal @project.name, Project.find(@project.id).name
    assert_template :edit
  end

end
