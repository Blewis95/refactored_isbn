def valid_isbn?(isbn_string)								#Main Function
	new_num = isbn_dash_and_space_deleter(isbn_string)		#runs the function to take the inputed string and delete the spaces and dashed in it.

	# puts new_num.length 									#for debugging purposes (lines 4-6)
	# puts check_for_symbols(new_num)
	# puts isbn_10_x_check?(new_num)

	if (new_num.length == 10) && (check_for_symbols(new_num)) && isbn_10_x_check?(new_num)	#checks the string length to equal 10 and runs the function to check for symbols and runs the function  to check for any x's in the isbn number
		isbn_10_sumcheck(new_num)							#runs the function to check if the inputed isbn-10 is valid
	elsif (new_num.length == 13) && (check_for_symbols(new_num))	#checks the string length to equal 13 and runs the function to check for symbols
		isbn_13_sumcheck(new_num)							#runs the function to check if the inputed isbn-13 is valid
	else
		return false										#if none of the conditions fail, return false
	end

end

def isbn_dash_and_space_deleter(isbn_num)					# function that takes in an isbn number as a string and deletes the spaces and dashes in it
	new_num = isbn_num.delete("-")
	new_num = new_num.delete(" ")
	return new_num											#returns the new string
end

def isbn_10_sumcheck(isbn_num)								#function to check if the isbn-10 number is valid

	isbn_array = isbn_num.split("")							#makes an array of each character in the inputed isbn number
	array_length = isbn_array.length

	#puts array_length

	sum = 0
	isbn_number_array = Array.new

	(array_length).times do |i|								#.times loop to change all the characters in the array made earlier to fixed numbers; goes for the length of the array
		isbn_number_array[i] = isbn_array[i].to_i
	end

	#print isbn_number_array								#for debugging


	for i in 1..(array_length - 1)							#for loop going from 1 to the length of the array -
		sum += isbn_number_array[i - 1] * i 				#adds each number in the array multiplied by whatever i is in the loop
		#puts isbn_number_array[i]
	end

	#print sum

	checksum = sum % 11										#takes the new sum and take modulo 11 to it 

	#print checksum

	if checksum == isbn_number_array.last					#compares the last digit calculated to the last digit in the inputed isbn 
		return true											#if they match then return true
	
	else
		return false										#else return false
	end

end

def isbn_13_sumcheck(isbn_num)								#function to check if the isbn-13 number is valid
															#refer to isbn_10_sumcheck comments for repeated code
	isbn_array = isbn_num.split("")
	array_length = isbn_array.length

	#puts array_length

	sum = 0
	isbn_number_array = Array.new

	(array_length).times do |i|
		isbn_number_array[i] = isbn_array[i].to_i
	end

	#print isbn_number_array


	for i in 0..(array_length - 2)							#loop going from 0 to the array length minus 2
		if (i % 2 == 1)										#if i is odd, multiply the number in the array by 3 and add it to sum
			sum += 3 * isbn_number_array[i]

			# print isbn_number_array[i], " "
			# puts sum
			
		else
			sum += 1 * isbn_number_array[i]					#else multiply the number in the array by 1 and add it to sum

			#print isbn_number_array[i], " "
			# puts sum
		end
		#puts isbn_number_array[i]
	end

	#print sum

	checksum = sum % 10										#takes the new sum and does modulo 11 to it

	checksum = 10 - checksum								#takes the new checksum and subtracts it from 10

	checksum = checksum % 10								#modulo the outputby 10

	#puts checksum

	if checksum == isbn_number_array.last
		return true
	else
		return false
	end

end


def check_for_symbols(symbol_check)							#function that checks for invalid symbols in the inputed isbn
	symbol_check2 = symbol_check.split("")
	array = Array.new

	symbol_check2.each do |holder|							#.each loop to go for as long as the array and adds all numbers into a new array
		if (holder == "0") || (holder == "1") || (holder == "2") || (holder == "3") || (holder == "4") || (holder == "5") || (holder == "6") || (holder == "7") || (holder == "8") || (holder == "9")

			array.push(holder)
		end
	end

	if (array.length == symbol_check.length)				#if new array and inputed array are the same length then return true
		return true
	else
		return false
	end
end

def isbn_10_x_check?(isbn)									#function to check if there are any x's in the isbn-10 number
	if isbn.upcase.include?("X")
		if (isbn.upcase.index("X") == isbn.length - 1)		#if the x is in the last spot return true, else false
			return true
		else
			return false
		end
	else
		return true
	end
end