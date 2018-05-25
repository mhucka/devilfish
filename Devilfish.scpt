-- =============================================================================
-- @file    Devilfish
-- @brief   Snapshot a web page to DEVONthink and also archive it
-- @author  Michael Hucka <mhucka@caltech.edu>
-- @license Please see the file LICENSE in the parent directory
-- @repo    https://github.com/mhucka/devilfish
-- =============================================================================

-- Global variables and constants.
-- ............................................................................

global archiveRootPath

set home to get path to home folder as string
set archiveRootPath to POSIX path of home & "archives/web-archives"


-- Utility functions.
-- ............................................................................

on quitIfMissing(theName, theId)
	try
		tell application "Finder"
			get name of application file id theId
		end tell
	on error
		display dialog "Could not find application " & theName & " – quitting."
		return 1
	end try
end quitIfMissing

-- From Nigel Garvey's CSV-to-list converter
-- http://macscripter.net/viewtopic.php?pid=125444#p125444
on trim(txt)
	repeat with i from 1 to (count txt) - 1
		if (txt begins with space) then
			set txt to text 2 thru -1 of txt
		else
			exit repeat
		end if
	end repeat
	repeat with i from 1 to (count txt) - 1
		if (txt ends with space) then
			set txt to text 1 thru -2 of txt
		else
			exit repeat
		end if
	end repeat
	if (txt is space) then set txt to ""
	return txt
end trim

on getWebPageData()
	tell application "System Events"
		set frontApp to item 1 of (get name of processes whose frontmost is true)
	end tell
	-- FIXME switch code based on which browser is being used
	-- see here for how: https://daringfireball.net/2009/01/applescripts_targetting_safari_or_webkit
	try
		if (frontApp = "Safari") then
			tell application "Safari"
				set theTitle to get name of the current tab of the front window
				set theURL to get URL of the current tab of the front window
				set selectedText to do JavaScript "\"\"+window.getSelection();" in document of the front window
			end tell
		else if (frontApp = "Google Chrome") then
			tell application "Google Chrome"
				set theTitle to get title of the active tab of the front window
				set theURL to get URL of the active tab of the front window
				set selectedText to ""
			end tell
		else
			display dialog "Don't know how to work with " & frontApp & " – quitting."
			return 1
		end if
	on error
		display dialog "Could not obtain info from " & frontApp & "." buttons {"OK"} with icon 2
		return {"", "", ""}
	end try
	return {theURL, theTitle, selectedText}
end getWebPageData

on askDtDestination()
	tell application "System Events"
		set activeApp to name of first application process whose frontmost is true
	end tell
	set theTags to ""
	set saveExternally to false
	tell application id "com.devon-technologies.thinkpro2"
		set theDtDestination to display group selector "Destination" buttons {"Cancel", "OK"}
		activate
		set theTags to display name editor "Add Tags" info "Tags (separated by semicolons):"
		display alert "Save to external archiving sites?" buttons {"No", "Yes"}
		if button returned of result = "Yes" then
			set saveExternally to true
		end if
	end tell
	tell application activeApp
		activate
	end tell
	return {theDtDestination, theTags, saveExternally}
end askDtDestination

on generateBaseFileName(theTitle)
	set {year:y, month:m, day:d} to (current date)
	set fileName to do shell script "echo " & quoted form of theTitle & " | sed 's|[^a-zA-Z0-9 ]||g'"
	set fileName to trim(fileName)
	set firstChar to character 1 of fileName
	set directoryPath to archiveRootPath & "/" & firstChar & "/" & y
	# Make sure path exists. I'm tired of dealing with AppleScript path conversions
	# so I'm just going to call out to the shell here.
	do shell script "mkdir -p '" & directoryPath & "'"
	set baseFileName to directoryPath & "/" & fileName
	return baseFileName
end generateBaseFileName

on createPDFinDt(theDestination, theURL, theTitle, theTags, destinationPath)
	tell application id "DNtp"
		set thisRecord to create PDF document from theURL width 1280 in theDestination without pagination
		if exists thisRecord then
			tell thisRecord
				set title to theTitle
				set comment to destinationPath
				set thisUUID to ("x-devonthink-item://" & uuid of thisRecord) as string
				if theTags is not "" then
					set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ";"}
					set tagList to text items of theTags
					set AppleScript's text item delimiters to od
					set tags to tagList & {"archived-page"}
				end if
			end tell
		end if
	end tell
	return {thisRecord, thisUUID}
end createPDFinDt

on createWebArchiveInDt(theDestination, theURL, theTitle)
	tell application id "DNtp"
		set thisArchive to create web document from theURL in theDestination
		return thisArchive
	end tell
end createWebArchiveInDt

on moveArchiveToDestination(archiveRecord, destinationPath, theUUID, theURL)
	tell application id "DNtp"
		set archivePath to path of archiveRecord as POSIX file
	end tell
	tell application "Finder"
		-- I cannot for the life of me get the finder duplicate command
		-- to work; keeps giving me errors about paths. Using cp instead.
		do shell script "cp -a '" & (POSIX path of archivePath) & "' '" & destinationPath & "'"
		set comment of ((POSIX file destinationPath) as alias) to theURL
	end tell
	tell application id "DNtp"
		move record archiveRecord to trash group of current database
	end tell
end moveArchiveToDestination

on sendToIA(theURL)
	do shell script "curl -s 'https://web.archive.org/save/" & theURL & "' > /dev/null 2>&1 &"
end sendToIA

on sendToWebcitation(theURL)
	do shell script "curl -s 'http://www.webcitation.org/archive?url=" & theURL & "&email=mhucka@gmail.com' > /dev/null 2>&1 &"
end sendToWebcitation

on sendToArchiveIS(theURL)
	do shell script "curl -data url=" & theURL & " http://archive.is/submit/ > /dev/null 2>&1 &"
end sendToArchiveIS

-- Main body.
-- ............................................................................

my quitIfMissing("DEVONthink Pro", "com.devon-technologies.thinkpro2")
tell application "DEVONthink Pro" to launch
tell application "System Events"
	set visible of application process "DEVONthink Pro" to false
end tell

set {theDestination, theTags, saveExternallyToo} to askDtDestination()
set {theURL, theTitle, selectedText} to my getWebPageData()

set destinationPath to generateBaseFileName(theTitle) & ".webarchive"
set {dtRecord, theUUID} to my createPDFinDt(theDestination, theURL, theTitle, theTags, destinationPath)
set dtArchive to my createWebArchiveInDt(theDestination, theURL, theTitle)
moveArchiveToDestination(dtArchive, destinationPath, theUUID, theURL)

if saveExternallyToo then
	sendToIA(theURL)
	sendToArchiveIS(theURL)
	sendToWebcitation(theURL)
end if
