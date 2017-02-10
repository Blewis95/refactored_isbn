require "minitest/autorun"
require_relative "isbn.rb"

class TestISBN < Minitest::Test

	# def test_length_is_equal_to_10
	# 	assert_equal(true,isbn_10_checker("123456789x"))
	# end

	# def test_length_is_less_than_10
	# 	assert_equal(false,isbn_10_checker("12345"))
	# end

	# def test_length_is_greater_than_10
	# 	assert_equal(false,isbn_10_checker("112344567899"))
	# end

	# def test_gets_rid_of_dashes
	# 	assert_equal("12345", isbn_dash_and_space_deleter("1-2-3-4-5"))
	# end

	# def test_gets_rid_of_spaces
	# 	assert_equal("12345", isbn_dash_and_space_deleter("1 2 3 4 5"))
	# end

	# def test_successful_case_isbn10
	# 	assert_equal(true, isbn_10_sumcheck("0471958697"))
	# end

	# def test_failed_case_isbn10
	# 	assert_equal(false,isbn_10_sumcheck("4780470059029"))
	# end



	# def test_length_is_equal_to_13
	# 	assert_equal(true,isbn_13_checker("1234567890123"))
	# end

	# def test_length_is_less_than_13
	# 	assert_equal(false,isbn_13_checker("12345"))
	# end

	# def test_length_is_greater_than_13
	# 	assert_equal(false,isbn_13_checker("1123445678999999"))
	# end

	# def test_successful_case1_isbn13
	# 	assert_equal(true, isbn_13_sumcheck("9780470059029"))
	# end

	# def test_successful_case2_isbn13
	# 	assert_equal(true, isbn_13_sumcheck("978-0-13-149505-0"))
	# end

	# def test_successful_case3_isbn13
	# 	assert_equal(true, isbn_13_sumcheck("978 0 471 48648 0"))
	# end

	# def test_failed_case_isbn13
	# 	assert_equal(false,isbn_13_sumcheck("4780470059029"))
	# end

	# def test_invalid_character_at_symbol_isbn10
	# 	assert_equal("Error, Entry must be a String of Fixnums",isbn_10_sumcheck("0-321@14653-0"))
	# end

	# def test_isbn10_x_check_return_true
	# 	assert_equal(true, isbn_10_x_check?("123456789x"))
	# end

	# def test_isbn10_x_check_return_false
	# 	assert_equal(false, isbn_10_x_check?("1234x6789"))
	# end

	#________________________Main Function______________________

	#________________________isbn 10____________________________

	def test_main_function_valid_dashed_isbn13
		assert_equal(true, valid_isbn?("978-0-13-149505-0"))
	end

	def test_main_function_valid_spaced_isbn13
		assert_equal(true, valid_isbn?("978 0 471 48648 0"))
	end

	def test_main_function_valid_isbn13
		assert_equal(true, valid_isbn?("9780470059029"))
	end

	def test_main_function_invalid_isbn13_with_x
		assert_equal(false, valid_isbn?("97804x0059029"))
	end

	def test_main_function_invalid_isbn13_with_letter
		assert_equal(false, valid_isbn?("97804e0059029"))
	end

	def test_main_function_invalid_isbn13
		assert_equal(false, valid_isbn?("4780470059029"))
	end

	def test_main_function_invalid_isbn13_too_long
		assert_equal(false, valid_isbn?("87719558692353442345"))
	end

	#____________________isbn 10's________________________

	def test_main_function_valid_dashed_isbn10
		assert_equal(true, valid_isbn?("0-321-14653-0"))
	end

	def test_main_function_valid_spaced_isbn10
		assert_equal(true, valid_isbn?("0 321 14653 0"))
	end

	def test_main_function_valid_isbn10
		assert_equal(true, valid_isbn?("0471958697"))
	end

	def test_main_function_invalid_isbn10_with_x
		assert_equal(false, valid_isbn?("0471958x97"))
	end

	def test_main_function_invalid_isbn10_with_letter
		assert_equal(false, valid_isbn?("0471e58697"))
	end

	def test_main_function_invalid_isbn10
		assert_equal(false, valid_isbn?("8771955869"))
	end

	def test_main_function_invalid_isbn10_too_long
		assert_equal(false, valid_isbn?("87719558692353442345"))
	end
end