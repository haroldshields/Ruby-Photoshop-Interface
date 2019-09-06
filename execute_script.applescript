-- use the 'on run' handler to get the arguments
on run arguments
  set path_to_javascript to  item 1 of arguments
  set script_timeout to item 2 of arguments
  set javascript_args to items 3 through (length of arguments) of arguments
  with timeout of script_timeout seconds
    tell application "Adobe Photoshop CC 2015.5"
      activate
      set javascript_reply to do javascript file path_to_javascript with arguments javascript_args show debugger never
      return javascript_reply
    end tell
  end timeout
end run
