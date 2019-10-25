// sample jsx code for Windows.

// do something with the parameters.
for (var i = 1; i < arguments.length; i++) {
	// Ignore the 0th argument because it's always undefined as nil 
	// is unshifted to the parameters array before it's passed from ruby.
	// DoJavaScriptFile from the Win32OLE API doesn't work unless the first
	// item of the parameters array is a nil object. 
	// This seems to be a bug or some sort of undocumented feature.
	// https://www.adobe.com/content/dam/acom/en/devnet/photoshop/pdfs/photoshop-cc-vbs-ref-2019.pdf
	alert('argument ' + i + ': ' + arguments[i]);
}

// test throwing an error.
if (confirm('Would you like to test throwing an error?')) {
  var errorString = "message: This error is from Photoshop." + ", line: "+ $.line + ", file: " + File($.fileName).fsName;
  throw new Error(errorString);
}

// return a result.
'This is the result from Photoshop for Windows.';