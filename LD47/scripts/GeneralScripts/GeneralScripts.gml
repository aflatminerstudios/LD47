// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function scrNull()
/// @desc Does nothing
function scrNullScript() {
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


/// @function scrAddSeparator(number, separator, digits)
/// @param number The WHOLE number to add separator to
/// @param separator The separator to add
/// @param digits The number of digits between separators
function scrAddSeparator(number, separator, digits) {

  var retVal = "";
  var count = 0;
  for (var i = string_length(number); i > 0; i--) {
    retVal = string_char_at(number, i) + retVal;
    
    if (++count == digits && i > 1) {
    
      count = 0;
      retVal = separator + retVal;
    }
  }

  return retVal;

}

