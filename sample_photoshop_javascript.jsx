// sample jsx code.

// do something with the parameters.
for (var i = 0; i < arguments.length; i++) {
  alert('argument ' + i + ': ' + arguments[i]);
}

// test throwing an error.
if (confirm('Would you like to test throwing an error?')) {
  var errorString = "message: This error is from Photoshop." + ", line: "+ $.line + ", file: " + File($.fileName).fsName;
  throw new Error(errorString);
}

// return a result.
'This is the result from Photoshop.';
