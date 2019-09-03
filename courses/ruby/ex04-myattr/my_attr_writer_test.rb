require "minitest/autorun"
require "minitest/pride"
require_relative "my_attr_writer"

class MyAsttrWriterTest < Minitest::Test
  Module.prepend MyBase
  def test_single_my_attr_writer
    klass = Class.new do
      my_attr_writer :writable_encoder, :writable_decoder
      attr_reader :writable_encoder
      attr_reader :writable_decoder
    end
    instance = klass.new
    instance.writable_encoder = "youareloosers"
    instance.writable_decoder = "eW91YXJlbG9vc2Vycw==\n"
    assert_equal "eW91YXJlbG9vc2Vycw==\n", instance.writable_encoder
    assert_equal "youareloosers", instance.writable_decoder
  end
end
