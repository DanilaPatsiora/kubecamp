require "minitest/autorun"
require "minitest/pride"

require_relative "ex05"

class Ex05Test < Minitest::Test
  def test_initialize
    line = "hello world!"
    string = line.ask

    assert_equal line, string
  end

  def test_check_method_name
    line = "check"
    string = line.ask
    res = string.check?

    assert_equal true, res
  end

  def test_check_other_method_name
    line = "other_check"
    string = line.ask
    res = string.check?

    assert_equal false, res
  end

  def test_check_class
    line = "hello world"
    string = line.ask
    cls = string.class

    assert_equal StringAsk, cls
  end

  def test_check_parent_class
    line = "hello world"
    string = line.ask
    cls = string.parent

    assert_equal String, cls
  end

  def test_length
    line = "hello world"
    string = line.ask

    assert_equal line.length, string.length
  end
end
