require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = tags(:tag1)
  end

  test "tags attributes must not be empty" do
    tag = Tag.new
    assert tag.invalid?
    assert tag.errors[:name].any?
    assert tag.errors[:slug].any?
  end

  test "should save a tag" do
    assert @tag.valid?
    assert @tag.save
  end

  test "should not save tag without name" do
    @tag.name = ""
    assert @tag.invalid?
    assert !@tag.save
  end

  test "should not save tag without slug" do
    @tag.slug = ""
    assert @tag.invalid?
    assert !@tag.save
  end

  test "tags are not valid without a unique name" do
    tag = Tag.new(name: tags(:tag1).name, slug: "test")
    assert tag.invalid?
    assert !tag.save
  end

  test "tags are not valid without a unique slug" do
    tag = Tag.new(name: "An example title", slug: tags(:tag1).slug)
    assert tag.invalid?
    assert !tag.save
  end
  
end
