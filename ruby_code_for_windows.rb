require 'win32ole'
require 'timeout'

# setup

project_dir = File.expand_path(File.dirname(__FILE__))
jsx_script_path = "#{project_dir}/sample_photoshop_javascript_for_windows.jsx"
jsx_script_timeout = 30
jsx_execution_mode = 1 # never show debugger
# jsx_params array can contain any number of strings or numbers only
jsx_params = ['Hello world', 7.5, 'Another parameter.']
# prepend a nil value to the beginning of the jsx_params array. Without it, an error in PS is thrown.
# see sample_photoshop_javascript_for_windows.jsx for an explaination.
jsx_params.unshift(nil) 

script_result = Timeout::timeout(jsx_script_timeout) {
	# This timeout block will not actually exit upon reaching the timeout value. 
	# More work needs to be done to resolve this issue.
	photoshop = WIN32OLE.new("Photoshop.Application.90") #change this string to your version of Photoshop (found in registry).
	photoshop.DoJavaScriptFile(jsx_script_path, jsx_params, jsx_execution_mode)
}

puts script_result