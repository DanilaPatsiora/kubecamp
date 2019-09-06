require "minitest/autorun"
require "minitest/pride"
require_relative "ex07.rb"

class Ex07MyAppTest < Minitest::Test
  Module.prepend MyApp
  def test_load_from_yml
    skip
    assert_equal MyApp.config.class, MyApp::Config
  end
  def test_object_id
    skip
    inst1 = MyApp.config
    inst2 = MyApp.config
    assert_equal inst1.object_id, inst2.object_id
  end
  def test_read_hash_field
    skip
    inst = MyApp.config
    assert_equal inst.app_name, "some_name"
    assert_equal inst.app_author, "Author"
  end
  def test_missing_field
    skip
    inst = MyApp.config
    assert_equal inst.miss_field, "Undefined field"
  end
end