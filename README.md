# Ruby-Photoshop-Interface
## A direct interface between Ruby and Photoshop

This repo demonstrates how to send the `do javascript` (Macintosh) or `DoJavaScriptFile` (Windows) command to Photoshop with parameters and get a result or error back via the traditional call chain.

This demonstration has Ruby demonstration files for Windows and Macintosh.

The Windows Ruby script uses the win32ole gem to execute the Photoshop `DoJavaScriptFile` command.

The Macintosh Ruby script uses `osascript` to call an AppleScript which is a liaison between Ruby and Photoshop.

To test it out, clone the repo, cd into the directory and run `ruby ruby_code_for_<mac or windows>.rb`. Photoshop will display an alert for each parameter. You can test throwing an error from Photoshop in the final confirm dialog.

You may have to modify the name of the Photoshop application in `execute_script.applescript` to match your Mac version.
On Windows, the Photoshop version is specified as an integer found in the key registry (e.g: `Photoshop.Application.90`).

If you wait > 30 seconds to respond to the alert messages in Photoshop, the timeout will be exceeded and an `AppleEventTimeoutError` will be thrown. This timeout can be changed on line 9 of `ruby_code_for_mac.rb`.

The Windows version has a timeout block specified but does not actually exit the block upon reaching the time_out value. More work needs to be done on this portion to get Ruby to exit the block upon timeout.
