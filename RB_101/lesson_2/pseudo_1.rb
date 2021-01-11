a method that returns the sum of two integers

1. ask user for the first number
2. store that number in a variable
3. ask the user for the second number
4. store that number in another variable
5. return the result of adding the first and the second number together

START

GET the first number from user
SET the number into a variable num1
GET the second number from user
SET the number into another variable num2
PRINT num1 + num2
END


#######


a method that takes an array of strings,
and returns a string that is all those strings concatenated together

1. get an array of strings from user
2. create an empty string to hold concatinated strings
3. loop through array and add each element to string
4. return the string

START

# given an array of strings called strings

SET iterator to 0
SET saved_string = empty string

WHILE iterator < length of strings array
  add the value in strings that is at the current itereator location to saved_string
  
  itereator = iterator + 1

PRINT saved_string
END


######


a method that takes an array of integers, and returns a new array with every other element

1. take in array of integers
2. create an empty array to store elements
3. loop through given array
4. on every other iteration, skip
5. return new array

START

# given an array of integers

SET iterator to 1
SET new_array = value at location 0 of the given array

WHILE iterator < the length of the given array
  IF iterator / 2 = 1
    add the interger at the current iterator location to new_array
  ELSE
    skip to next iterator

PRINT new_array