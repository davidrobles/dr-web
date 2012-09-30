require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = posts(:post1)
  end

  test "posts attributes must not be empty" do
    post = Post.new
    assert post.invalid?
    assert post.errors[:title].any?
    assert post.errors[:slug].any?
    assert post.errors[:body].any?
  end

  test "should save a post" do
    assert @post.valid?
    assert @post.save
  end

  test "should not save post without title" do
    @post.title = ""
    assert @post.invalid?
    assert !@post.save
  end

  test "should not save post without slug" do
    @post.slug = ""
    assert @post.invalid?
    assert !@post.save
  end

  test "should not save post without body" do
    @post.body = ""
    assert @post.invalid?
    assert !@post.save
  end

  test "posts are not valid without a unique title" do
    post = Post.new(title: posts(:post1).title, slug: "test", body: "The body")
    assert post.invalid?
    assert !post.save
  end

  test "posts are not valid without a unique slug" do
    post = Post.new(title: "An example title", slug: posts(:post1).slug, body: "The body")
    assert post.invalid?
    assert !post.save
  end

end

