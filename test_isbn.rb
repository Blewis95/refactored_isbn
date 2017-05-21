# Create a program that will verify if a string is a valid ISBN number (see requirements below).
# Use a TDD approach.
# This is a big exercise - break it down into chunks!

# REQUIREMENTS FOR ISBN
# ISBN-10 is made up of 9 digits plus a check digit (which
# may be 'X') and ISBN-13 is made up of 12 digits plus a
# check digit. Spaces and hyphens may be included in a code,
# but are not significant. This means that 9780471486480 is
# equivalent to 978-0-471-48648-0 and 978 0 471 48648 0.
# The check digit for ISBN-10 is calculated by multiplying
# each digit by its position (i.e., 1 x 1st digit, 2 x 2nd
# digit, etc.), summing these products together and taking
# modulo 11 of the result (with 'X' being used if the result
# is 10).

# The check digit for ISBN-13 is calculated by multiplying
# each digit alternately by 1 or 3 (i.e., 1 x 1st digit,
# 3 x 2nd digit, 1 x 3rd digit, 3 x 4th digit, etc.), summing
# these products together, taking modulo 10 of the result
# and subtracting this value from 10, and then taking the
# modulo 10 of the result again to produce a single digit.

# Examples of valid ISBN-13:
# "9780470059029"
# "978-0-13-149505-0"
# "978 0 471 48648 0"

# Examples of valid ISBN-10:
# "0471958697"
# "0-321-14653-0"
# "877195869x"

# Examples of invalid ISBNs:
# "4780470059029"
# "0-321@14653-0"
# "877195x869"
# ""
# " "
# "-"

# Example of how the ISBN-10 sumcheck is calculated:
# first 9 digits of an isbn10: 742139476
# create checksum:
# sum = 1*7 + 2*4 + 3*2 + 4*1 + 5*3 + 6*9 7*4 + 8*7 + 9*6
# sum = 7 + 8 + 6 + 4 + 15 + 54 + 28 + 56 + 54
# sum = 232
# checksum = 232%11
# checksum = 1
# isbn = 7421394761 

require "minitest/autorun"
require_relative "isbn.rb"

class TestISBN < Minitest::Test

	def test_gets_rid_of_dashes
		assert_equal("12345", isbn_dash_and_space_deleter("1-2-3-4-5"))
	end

	def test_gets_rid_of_spaces
		assert_equal("12345", isbn_dash_and_space_deleter("1 2 3 4 5"))
	end

	def test_successful_case_isbn10
		assert_equal(true, isbn_10_sumcheck("0471958697"))
	end

	def test_failed_case_isbn10
		assert_equal(false,isbn_10_sumcheck("4780470059029"))
	end


	def test_isbn10_x_check_return_true
		assert_equal(true, isbn_10_x_check?("123456789x"))
	end

	def test_isbn10_x_check_return_false
		assert_equal(false, isbn_10_x_check?("1234x6789"))
	end

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