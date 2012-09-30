require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:project1)
  end

  test "projects attributes must not be empty" do
    project = Project.new
    assert project.invalid?
    assert project.errors[:title].any?
    assert project.errors[:slug].any?
    assert project.errors[:body].any?
  end

  test "should save a project" do
    assert @project.valid?
    assert @project.save
  end

  test "should not save project without title" do
    @project.title = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "should not save project without slug" do
    @project.slug = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "should not save project without body" do
    @project.body = ""
    assert @project.invalid?
    assert !@project.save
  end

  test "projects are not valid without a unique title" do
    project = Project.new(title: projects(:project1).title, slug: "test", body: "The body")
    assert project.invalid?
    assert !project.save
  end

  test "projects are not valid without a unique slug" do
    project = Project.new(title: "An example title", slug: projects(:project1).slug, body: "The body")
    assert project.invalid?
    assert !project.save
  end

end
