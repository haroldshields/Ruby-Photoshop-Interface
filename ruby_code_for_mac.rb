# A direct interface between Ruby and Photoshop.
# by Harold Shields, haroldshields@mac.com

require 'open3'
# setup
project_dir = File.expand_path(File.dirname(__FILE__))
path_to_applescript = "#{project_dir}/execute_script.applescript"
path_to_jsx_script = "#{project_dir}/sample_photoshop_javascript_for_mac.jsx"
script_timeout = 30
# jsx params array can contain any number of strings or numbers only
jsx_params = ['Hello world', 7.5, 'Another parameter.']
# escape the sting parameters so they don't foul up the osascript call string.
escaped_params = jsx_params.map { |param| param.is_a?(String)? param.dump : param }
call_string = "osascript '#{path_to_applescript}' '#{path_to_jsx_script}' #{script_timeout} #{escaped_params.join(' ')} "
# define a few error classes
class PhotoshopJsxError < StandardError ; end
class AppleEventTimeoutError < StandardError ; end
# call osascript
Open3.popen3(call_string) do |stdin, stdout, stderr, thread|
  standard_error = stderr.read
  standard_out = stdout.read
  if standard_error.empty?
    puts standard_out
  else
    if standard_error.include? "AppleEvent timed out. (-1712)"
      raise AppleEventTimeoutError,  standard_error
    end
    raise PhotoshopJsxError,  standard_error
  end
end
