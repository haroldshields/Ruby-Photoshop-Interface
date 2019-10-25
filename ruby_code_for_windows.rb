# A direct interface between Ruby and Photoshop for Windows.
# by Harold Shields, haroldshields@mac.com

require 'win32ole'
require 'timeout'

# setup
# jsx_params array can contain any number of strings or numbers only
jsx_params = ['Hello world', 7.5, 'Another parameter.']
jsx_script_timeout = 30

class DoJavaScriptFileTimeoutError < StandardError ; end
project_dir = File.expand_path(File.dirname(__FILE__))
jsx_script_path = "#{project_dir}/sample_photoshop_javascript_for_windows.jsx"
jsx_execution_mode = 1 # never show debugger

# prepend a nil value to the beginning of the jsx_params array. Without it, an error in PS is thrown.
# see sample_photoshop_javascript_for_windows.jsx for an explaination.
jsx_params.unshift(nil) 

# Create a new thread for the DoJavaScriptFile command.
thread = Thread.new do
	photoshop = WIN32OLE.new("Photoshop.Application.90") #change this string to your version of Photoshop (found in registry).
	photoshop.DoJavaScriptFile(jsx_script_path, jsx_params, jsx_execution_mode)
end

# wait for the thread to complete or timeout to be met
elapsed_seconds = 0
while elapsed_seconds < jsx_script_timeout and thread.alive?
	sleep 1
	elapsed_seconds += 1
end
sleep 1
if thread.alive?
	thread.kill
	raise DoJavaScriptFileTimeoutError, "DoJavaScriptFile timedout after #{script_timeout} seconds"
end

puts "result: #{thread.value}"