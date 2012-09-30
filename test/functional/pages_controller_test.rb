require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should match /about" do
    assert_recognizes({ controller: "pages", action: "about" }, "about")
  end

  test "should match /contact" do
    assert_recognizes({ controller: "pages", action: "contact" }, "contact")
  end

end

