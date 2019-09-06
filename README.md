# Ruby-Photoshop-Interface
## A direct interface between Ruby and Photoshop

This repo demonstrates how to send the `do javascript` command to Photoshop with parameters and get a result or error via the traditional call chain.

It uses `osascript` to call an AppleScript which is a liaison between ruby and Photoshop.

To test it out, clone the repo, cd into the directory and run `ruby ruby_code.rb`. Photoshop will display an alert for each parameter. You can test throwing a `PhotoshopJsxError` in the last alert dialog.

You may have to modify the name of the Photoshop application in `execute_script.applescript` to match yours.

If you wait > 30 to respond to the alert messages in Photoshop the timeout will be exceeded and an `AppleEventTimeoutError` will be thrown. This timeout can be changed on line 9 of `ruby_code.rb`.
