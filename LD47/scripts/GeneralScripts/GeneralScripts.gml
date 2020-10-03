// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function scrNull()
/// @desc Does nothing
function scrNull() {
  return;
}

/// @description scrLeadingZeros(num, numDigits)
/// @param The number to print
/// @param The minimum number of total digits to print
function scrLeadingZeros(num, numDigits) {    
  var returnString = string(num);

  var numZeros = max(0, numDigits - string_length(string(num)));

  for (var i = 0; i < numZeros; ++i) {
    returnString = "0" + returnString; 
  }

  return returnString;
}

