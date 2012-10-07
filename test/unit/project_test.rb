require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:project1)
  end

  test "projects attributes must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:name].any?
    assert project.errors[:slug].any?
    assert project.errors[:body].any?
  end

  test "should save a project" do
    assert @project.valid?
    assert @project.save
  end

  test "should not save project without name" do
    @project.name = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "should not save project without slug" do
    @project.slug = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "should not save project with invalid slug" do
    invalid_slugs = ['dd', 'this is wrong', 'This-is-wrong', 'this-is wrong']
    invalid_slugs.each do |slug|
      @project.slug = slug
      assert @project.invalid?, slug
      assert !@project.save
    end
  end

  test "should save project with valid slug" do
    slugs = ['min', 'this-is-a-valid-slug', '111', 'this-88-is-valid']
    slugs.each do |slug|
      @project.slug = slug
      assert @project.valid?, slug
      assert @project.save
    end
  end


  test "should not save project without body" do
    @project.body = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "projects are not valid without a unique name" do
    project = Project.new(name: projects(:project1).name, slug: "test", body: "The body")
    assert project.invalid?
    assert !project.save
  end

  test "projects are not valid without a unique slug" do
    project = Project.new(name: "An example name", slug: projects(:project1).slug, body: "The body")
    assert project.invalid?
    assert !project.save
  end

end
