# Variables
set appList to {"Boosteroid", "NVIDIA GeForce NOW", "Steam", "Calculator", "Other"}
set gamingKeyboardSettings to {globeKeyAction:"Do Nothing", enableStandardFnKeys:true, controlKeyMap:"🌐︎ Globe", globeKeyMap:"^ Control"}
set defaultKeyboardSettings to {globeKeyAction:"Change Input Source", enableStandardFnKeys:false, controlKeyMap:"^ Control", globeKeyMap:"🌐︎ Globe"}
set gamingTrackpadSettings to {enableNaturalScrolling:false, ingoreBuiltInTrackPad:true}
set defaultTrackpadSettings to {enableNaturalScrolling:true, ingoreBuiltInTrackPad:false}

# Functions

# Modify Trackpad Settings
# Options:
#  - enable/disable Natural Scrolling
on modifyTrackpad(trackpadSettings)
	
	display notification "Setting up Trackpad, please wait..." with title "Automator"
	
	# Unpack the Record
	set {enableNaturalScrolling:enableNaturalScrolling, ingoreBuiltInTrackPad:ingoreBuiltInTrackPad} to trackpadSettings
	
	open location "x-apple.systempreferences:com.apple.Trackpad-Settings.extension"
	
	tell application "System Events" to tell process "System Settings"
		# Put window in front
		set frontmost to true
		
		# Open Trackpad
		repeat until window begins with "Trackpad" exists
		end repeat
		
		# Wait until Trackpad window is the main window of the application and is accessible
		repeat until exists of (1st window whose value of attribute "AXMain" is true)
		end repeat
		
		# Wait until the group is displayed (needed else fails on Apple M2 Pro)
		repeat until exists group 1 of group 2 of splitter group 1 of group 1 of window 1
		end repeat
		
		# Disable natural scroll
		#select radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Trackpad"
		tell radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Trackpad"
			click
		end tell
		
		repeat until checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Trackpad" exists
		end repeat
		
		set theCheckbox to checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Trackpad"
		tell theCheckbox
			set checkboxStatus to value of theCheckbox as boolean
			if checkboxStatus is not enableNaturalScrolling then click theCheckbox
		end tell
		
		# Attempting to check the sheet at a certain point while closing will throw an error
		# In that case, the outer repeat will try again
		repeat
			try
				repeat while sheet 1 of window 1 exists
				end repeat
				exit repeat
			end try
		end repeat
	end tell
	
end modifyTrackpad

# Modify Keyboard Settings
# Options:
#  - enable/disable Fn (Globe) action
#  - swap Fn (Globe) and Control buttons
#  - switch F1, F2, etc
on modifyKeyboard(keyboardSettings)
	
	display notification "Setting up keyboard, please wait..." with title "Automator"
	
	# Unpack the Record
	set {globeKeyAction:globeKeyAction, enableStandardFnKeys:enableStandardFnKeys, controlKeyMap:controlKeyMap, globeKeyMap:globeKeyMap} to keyboardSettings
	
	open location "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
	
	tell application "System Events" to tell process "System Settings"
		# Put window in front
		set frontmost to true
		
		# Example window title: "Keyboard - 86%", so "begins with" is needed
		repeat until window begins with "Keyboard" exists
		end repeat
		
		# Wait until Keyboard window is the main window of the application and is accessible
		repeat until exists of (1st window whose value of attribute "AXMain" is true)
		end repeat
		
		# Wait until the group is displayed (needed else fails on Apple M2 Pro)
		repeat until exists group 1 of group 2 of splitter group 1 of group 1 of window 1
		end repeat
		
		# Disable Globe input switch
		repeat until exists pop up button 2 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		end repeat
		
		tell pop up button 2 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			click
			repeat until exists menu 1
			end repeat
			pick menu item globeKeyAction of menu 1
		end tell
		
		# "Keyboard Shortcuts..." Button
		click button 1 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		
		repeat until sheet 1 of window 1 exists
		end repeat
		
		# Looking for Function Keys
		tell row 11 of outline 1 of scroll area 1 of group 1 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			select
		end tell
		
		# Enable F1, F2, etc
		repeat until checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1 exists
		end repeat
		
		set theCheckbox to checkbox "Use F1, F2, etc. keys as standard function keys" of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		tell theCheckbox
			set checkboxStatus to value of theCheckbox as boolean
			if checkboxStatus is not enableStandardFnKeys then click theCheckbox
		end tell
		
		# Swap Fn (Globe) and Control buttons 
		
		# Looking for "Modifier Keys"
		tell row 12 of outline 1 of scroll area 1 of group 1 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			select
		end tell
		
		# Select proper keyboard
		repeat until exists pop up button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
		end repeat
		tell pop up button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			click
			repeat until exists menu 1
			end repeat
			pick menu item "Apple Internal Keyboard / Trackpad" of menu 1
		end tell
		
		repeat until exists pop up button 2 of group 2 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		end repeat
		tell pop up button 2 of group 2 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			click
			repeat until exists menu 1
			end repeat
			pick menu item controlKeyMap of menu 1
		end tell
		
		repeat until exists pop up button 5 of group 2 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		end repeat
		
		tell pop up button 5 of group 2 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			click
			repeat until exists menu 1
			end repeat
			pick menu item globeKeyMap of menu 1
		end tell
		
		# "Done" Button - Close the sheet so the application can quit
		click button 2 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
		
		# Attempting to check the sheet at a certain point while closing will throw an error
		# In that case, the outer repeat will try again
		repeat
			try
				repeat while sheet 1 of window 1 exists
				end repeat
				exit repeat
			end try
		end repeat
	end tell
	
	tell application "System Settings" to quit
end modifyKeyboard

# Modify Accessibility Pointer Control Settings settings
# Options:
#  - enable/disable built-in TrackPad
on modifyAccessibilityPointerControl(accessibilityPointerControlSettings)
	
	display notification "Setting up Trackpad, please wait..." with title "Automator"
	
	set {enableNaturalScrolling:enableNaturalScrolling, ingoreBuiltInTrackPad:ingoreBuiltInTrackPad} to accessibilityPointerControlSettings
	
	open location "x-apple.systempreferences:com.apple.Accessibility-Settings.extension"
	
	tell application "System Events" to tell process "System Settings"
		# put window in front
		set frontmost to true
		
		# Open Accessibility
		repeat until window begins with "Accessibility" exists
		end repeat
		
		# wait until Accessibility window is the main window of the application and is accessible
		repeat until exists of (1st window whose value of attribute "AXMain" is true)
		end repeat
		
		repeat until button 3 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Accessibility" exists
		end repeat
		
		# Move to pointer control tab
		tell button 3 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Accessibility"
			click
		end tell
		
		repeat until window "Pointer Control" exists
		end repeat
		
		set theCheckbox to checkbox 2 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Pointer Control"
		tell theCheckbox
			set checkboxStatus to value of theCheckbox as boolean
			if checkboxStatus is not ingoreBuiltInTrackPad then click theCheckbox
		end tell
		
		# Exit the menu
		tell button 1 of toolbar 1 of window "Pointer Control"
			click
		end tell
		
		# Attempting to check the sheet at a certain point while closing will throw an error
		# In that case, the outer repeat will try again
		repeat
			try
				repeat while sheet 1 of window 1 exists
				end repeat
				exit repeat
			end try
		end repeat
		
	end tell
	
end modifyAccessibilityPointerControl

# MAIN	
try
	
	display notification "App started!" with title "Automator"
	
	delay 1
	
	# Modify Trackpad Settings (Disabled)
	#modifyTrackpad(gamingTrackpadSettings)
	
	# Modify Accessibility Settings
	modifyAccessibilityPointerControl(gamingTrackpadSettings)
	
	# Modify Keyboard Settings
	modifyKeyboard(gamingKeyboardSettings)
	
	# Lets launch the app
	
	# Select from known list
	set appName to choose from list appList with prompt "Select your application:" default items {"Boosteroid"} as string
	
	# Custom app
	if ((appName as string) is equal to "Other") then
		set Other to display dialog "Please provide custom application name" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
		set appName to text returned of the Other
	end if
	
	# Convert to string
	set appName to appName as string
	
	activate application appName
	
	# Some apps need some time to enable
	delay 5
	
	# And wait until it is closed
	repeat while application appName is running
		delay 1
	end repeat
	
on error errorMessage
	display notification "An error occurred: " & errorMessage with title "Automator"
	delay 1
end try

# Modify Trackpad Settings (Disabled)
#modifyTrackpad(defaultTrackpadSettings)

# Modify Accessibility Settings
modifyAccessibilityPointerControl(defaultTrackpadSettings)

# Modify Keyboard Settings
modifyKeyboard(defaultKeyboardSettings)

delay 1

display notification "App finished!" with title "Automator"