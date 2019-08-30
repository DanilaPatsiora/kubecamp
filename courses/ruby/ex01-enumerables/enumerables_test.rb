# frozen_string_literal: true

require "minitest/autorun"
require "minitest/pride"

class EnumerablesTest < Minitest::Test
  def test_squares_each
    numbers = [1, 2, 3, 4, 5]
    actual = []
    numbers.each do |number|
      actual << number**2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_squares
    numbers = [1, 2, 3, 4, 5]
    actual = numbers.map do |number|
      number**2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_find_waldo_each
    words = %w[noise dog fair house waldo bucket fish]
    actual = nil
    words.each do |word|
      actual = word if word == "waldo"
    end
    assert_equal "waldo", actual
  end

  def test_find_waldo
    words = %w[noise dog fair house waldo bucket fish]
    actual = words.find do |word|
      word == "waldo"
    end
    assert_equal "waldo", actual
  end

  def test_pick_words_with_three_letters_each
    words = %w[pill bad finger cat blue dog table red]
    actual = []
    words.each {|i| actual.push(i) if i.length == 3 }
    assert_equal %w[bad cat dog red], actual
  end

  def test_pick_words_with_three_letters
    words = %w[pill bad finger cat blue dog table red]
    actual = words.select {|i| i.length == 3 }
    assert_equal %w[bad cat dog red], actual
  end

  def test_normalize_zip_codes_each
    numbers = [234, 10, 9119, 38_881]
    actual = []
    numbers.each do |x|
      tmp = ""
      k = 5 - x.to_s.length
      k.times do
        tmp += "0"
      end
      tmp += x.to_s
      actual << tmp
    end
    assert_equal %w[00234 00010 09119 38881], actual
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38_881]
    actual = numbers.map do |x|
      x = x.to_s
      x.prepend("0") until x.length == 5
      x
    end
    assert_equal %w[00234 00010 09119 38881], actual
  end

  def test_no_waldo_each
    words = %w[scarf sandcastle flag pretzel crow key]
    found = nil
    words.each {|x| found = 1 if x == "waldo" }
    assert_nil found
  end

  def test_no_waldo
    words = %w[scarf sandcastle flag pretzel crow key]
    act = words.select {|x| x == "waldo" }
    found = 0 unless act.empty?
    assert_nil found
  end

  def test_pick_floats_each
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = []
    numbers.each do |x|
      actual << x if x.is_a? Float
    end
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_pick_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = numbers.select {|x| x.is_a? Float }
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_words_with_no_vowels_each
    words = %w[green sheep travel least boat]
    actual = []
    words.each {|x| actual << x.gsub(/[aeiou]/, "") }
    assert_equal %w[grn shp trvl lst bt], actual
  end

  def test_words_with_no_vowels
    words = %w[green sheep travel least boat]
    actual = words.map {|x| x.gsub(/[aeiou]/, "") }
    assert_equal %w[grn shp trvl lst bt], actual
  end

  def test_has_at_least_one_zero_each
    numbers = [2, 0, 9, 3, 0, 1]
    actual = false
    numbers.each {|x| actual = true if x.zero? }
    assert_equal true, actual
  end

  def test_has_at_least_one_zero
    numbers = [2, 0, 9, 3, 0, 1]
    actual = numbers.any?(0)
    assert_equal true, actual
  end

  def test_all_gone_each
    words = %w[gone gone gone gone gone gone gone]
    actual = true
    words.each {|x| actual = false if x != "gone" }
    assert_equal true, actual
  end

  def test_all_gone
    words = %w[gone gone gone gone gone gone gone]
    actual = words.all?("gone")
    assert_equal true, actual
  end

  def test_count_numbers_greater_than_17_each
    numbers = [9, 18, 12, 17, 1, 3, 99]
    actual = 0
    numbers.each {|x| actual += 1 if x > 17 }
    assert_equal 2, actual
  end

  def test_count_numbers_greater_than_17
    numbers = [9, 18, 12, 17, 1, 3, 99]
    actual = numbers.count {|x| x > 17 }
    assert_equal 2, actual
  end

  def test_array_with_the_most_items_each
    arrays = [%i[a b c], [1, 2, 3, 4, 5], ["zoo", :things, :stuff]]
    actual = []
    arrays.each {|x| actual = x if x.length > actual.length }
    assert_equal [1, 2, 3, 4, 5], actual
  end

  def test_array_with_the_most_items
    arrays = [%i[a b c], [1, 2, 3, 4, 5], ["zoo", :things, :stuff]]
    actual = arrays.max_by(&:length)
    assert_equal [1, 2, 3, 4, 5], actual
  end

  def test_group_words_by_first_letter_each
    words = %w[ant axis albatross bolt badge butter car cdr column]
    actual = {}
    words.each do |x|
      index = x[0]
      actual[index] = [] if actual[index].nil?
      actual[index] << x
    end
    expected = {"a" => %w[ant axis albatross], "b" => %w[bolt badge butter], "c" => %w[car cdr column]}
    assert_equal expected, actual
  end

  def test_group_words_by_first_letter
    words = %w[ant axis albatross bolt badge butter car cdr column]
    actual = words.group_by {|a| a[0] }
    expected = {"a" => %w[ant axis albatross], "b" => %w[bolt badge butter], "c" => %w[car cdr column]}
    assert_equal expected, actual
  end

  def test_none_are_negative_each
    numbers = [9, 3, 1, 8, 3, 3, 5]
    actual = true
    numbers.each {|x| actual = false if x.negative? }
    assert true, actual
  end

  def test_none_are_negative
    numbers = [9, 3, 1, 8, 3, 3, 5]
    actual = numbers.all?(&:positive?)
    assert true, actual
  end

  def test_sum_a_list_of_numbers_each
    numbers = [32, 1, 21, 5, 81, 333]
    actual = 0
    numbers.each {|x| actual += x }
    assert_equal 473, actual
  end

  def test_sum_a_list_of_numbers
    numbers = [32, 1, 21, 5, 81, 333]
    actual = numbers.sum
    assert_equal 473, actual
  end

  def test_remove_numbers_divisible_by_3_each
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    actual = []
    numbers.each {|x| actual << x if x % 3 != 0 }
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], actual
  end

  def test_remove_numbers_divisible_by_3
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    actual = numbers.filter {|x| x % 3 != 0 }
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], actual
  end

  def test_speed_interview_pairs_each
    list1 = %w[Alice Bob Charlie]
    list2 = %w[Xenia Yves Zach]
    actual = []
    list1.each_with_index do |x, i|
      actual[i] = []
      actual[i] << x
      actual[i] << list2[i]
    end
    assert_equal [%w[Alice Xenia], %w[Bob Yves], %w[Charlie Zach]], actual
  end

  def test_speed_interview_pairs
    list1 = %w[Alice Bob Charlie]
    list2 = %w[Xenia Yves Zach]
    actual = list1.zip(list2)
    assert_equal [%w[Alice Xenia], %w[Bob Yves], %w[Charlie Zach]], actual
  end

  def test_has_a_multi_word_phrase_each
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    actual = false
    phrases.each {|x| actual = true if x.split(" ").length > 1 }
    assert_equal true, actual
  end

  def test_has_a_multi_word_phrase
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    actual = phrases.any? {|x| x.split(" ").length > 1 }
    assert_equal true, actual
  end

  def test_count_words_that_are_uppercase_each
    words = %w[trousers SOCKS sweater Cap SHOE TIE]
    actual = 0
    words.each {|x| actual += 1 if x == x.upcase }
    assert_equal 3, actual
  end

  def test_count_words_that_are_uppercase
    words = %w[trousers SOCKS sweater Cap SHOE TIE]
    actual = words.count {|x| x == x.upcase }
    assert_equal 3, actual
  end

  def test_smallest_number_each
    numbers = [1, 10, 100, 1000, 10_000, 1_000_000]
    actual = 20
    numbers.each {|x| actual = x if actual > x }
    assert_equal 1, actual
  end

  def test_smallest_number
    numbers = [1, 10, 100, 1000, 10_000, 1_000_000]
    actual = numbers.min
    assert_equal 1, actual
  end

  def test_multiply_list_of_numbers_each
    numbers = [2, 3, 5, 7]
    actual = 1
    numbers.each {|x| actual *= x }
    assert_equal 210, actual
  end

  def test_multiply_list_of_numbers
    numbers = [2, 3, 5, 7]
    actual = numbers.inject(:*)
    assert_equal 210, actual
  end

  def test_solitaire_each
    list1 = %w[Ace 6 10 Queen]
    list2 = %i[clubs diamonds hearts spades]
    actual = []
    list1.each_with_index do |x, i|
      actual[i] = []
      actual[i] << x
      actual[i] << list2[i]
    end
    assert_equal [["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]], actual
  end

  def test_solitaire
    list1 = %w[Ace 6 10 Queen]
    list2 = %i[clubs diamonds hearts spades]
    actual = list1.zip(list2)
    assert_equal [["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]], actual
  end

  def test_all_multiples_of_7_each
    numbers = [42, 14, 35, 49, 28, 56, 21, 7]
    actual = true
    numbers.each {|x| actual = false if x % 7 != 0 }
    assert actual
  end

  def test_all_multiples_of_7
    numbers = [42, 14, 35, 49, 28, 56, 21, 7]
    actual = numbers.all? {|x| (x % 7).zero? }
    assert actual
  end

  def test_sort_by_number_of_cents_each
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    lol = {}
    actual = []
    prices.each do |x|
      index = x - x.to_i
      actual << index
      lol[index] = x
    end
    actual = actual.sort
    actual = actual.map {|x| lol[x] }
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], actual
  end

  def test_sort_by_number_of_cents
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    actual = prices.sort_by {|x| x - x.to_i }
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], actual
  end
end
