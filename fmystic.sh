#!/bin/bash
#Check if xclip and fzf are installed
dpkg -s xclip 2>/dev/null >/dev/null || sudo apt-get install xclip
dpkg -s fzf 2>/dev/null >/dev/null || sudo apt-get install fzf
#display the rest of the file, with all mystic stuff
thisfile=`basename "$0"`
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
selected="$(cat $SCRIPT_DIR/$thisfile | tail -n+11 | grep "//" | sed 's/#//' | fzf -e -i)"
echo "${selected:4}" | cut -d"/" -f1 | tr -d '\n' | xclip -selection clipboard

#def access(acsstring): boolean //  Returns True or False if the user passes (has access) to the supplied <acsstring>
#def acsnogroup(access string): boolean //
#def pwrite(string) // Send pipe string to the user
#def pwriteln(string) // Send pipe string to the user with a carriage return
#def rwrite(string) // Send raw string to the user
#def rwriteln(string) //	Send raw string to the user with a carriage return
#def write(string) // Send string to the user with MCI filtering
#def writeln(string) //Send string to the user with MCI filtering and CRLF 
#def showfile(filename, baudrate, pause, abort, onlynew) : boolean // This function accepts the filename string followed by several boolean options represented as 1 for true or 0 for false.
#def getstr (Mode, FieldSize, MaxInput, DefaultText) : string // get input from user
#def param_count() : integer // Returns the number of parameters passed to the script when it was executed.
#def param_str(#) : string // param_str returns the parameter passed to the script, where # is the parameter number.
#def backspace(number, destructive): none // This function sends (number) backspaces and if (destructive) is True, then it will also delete the character. If False it will only move the cursor backwards.
#def charxy(x,y): tuple // Returns the character and attribute of the user's screen at the X/Y coordinate.
#def dated2u(date): integer // This converts a DOS crunched date to a Unix timestamp
#def datestr(unix_date,format): string // Converts a Unix date, to a string representation, according the format string you will provide.
#def dateu2d(date): integer // This converts a unix date to a DOS crunched date used in places in Mystic.
#def delay(milliseconds): none // Causes the program to wait for a specific number of milliseconds.
#def fl_close(handle): none // Closes an opened filelist. 
#def fl_found(handle): boolean // Returns true if a message from the last seek or next or prev function has been found.
#def fl_getdesc(handle): list // Returns a list that contains the file description.
#def fl_getfile(handle): dict // Returns a dictionary with information about the current file.
#def fl_next(handle) // Returns the next available file.
#def fl_open(basefn) // Opens a filelist where basefn is the filename for the file base, returning a handle to the filelist.
#def fl_prev(handle) // Returns the previous available file
#def fl_seek(handle, filenumber, skip) // Seeks to a file number.
#def flush() // This forces any data currently in Mystic's outbound buffer to be sent to the remote client.
#def getcfg(): dict // Returns basic configuration options in a Python dictionary.
#def getfbase(number): dict // Returns a dictionary of the file base located at record number <number>.
#def getfbaseid(number): dict // Returns a dictionary of the file base with the ID of <number>
#def getfgroup(number): dict // Returns a dictionary of the file group at record number <number>.
#def getfgroupid(number): dict // Returns a dictionary of the file group with the ID of <number>.
#def getkey(): tuple // Returns a tuple, containing the character of the key pressed and a boolean var, if the key is an extended one.
#def getmbase(num): dict // Returns a Message Base dictionary of the record physically located at (num).
#def getmbaseid(ID): dict // Returns a Message Base dictionary of the Message Base with ID of (ID)
#def getmgroup(number): dict // Returns a dictionary of the message group at record number <number>.
#def getmgroupid(number): dict // Returns a dictionary of the message group with the ID of <number>.
#def getnetaddr(number): dict // This function returns a network address configuration passed as number to the function.
#def getprompt(number): string // Will return prompt (number) from user's currently selected theme.
#def getuserid(ID): dict // Returns a user dictionary of the user associated with ID.
#def getyn(text, default): boolean // This presents a Yes/No prompt and returns True if they answer yes, False if they answer no.
#def gotoxy(x,y): none // This locates the cursor to the X and Y position if the user has ANSI graphics.
#def keypressed(): boolean // Returns True if the user pressed a key.
#def logerror(string) // This creates an entry into the global error log
#def mci2str(code): string // This function returns the value of an MCI code, where code is the two digit MCI code.
#def menucmd(command,parameters): none // Executes a Mystic command.
#def msg_close(mbase) // Closes the handle of a message base.
#def msg_delete(handle) // Deletes the message, which the handle is passed, from the message base.
#def msg_found(handle): boolean // Returns true if it finds a message in a message base.
#def msg_gethdr(handle): dict // Returns a dictionary, containing all header information for the message.
#def msg_gettxt(handle): list // Returns a list containing the text message.
#def msg_next(handle): boolean // Returns true if there is another message in the message base.
#def msg_open(filename): handle // Returns a message base handle, if the message base, with the given filename exists.
#def msg_prev(handle): object // Retrieves all information from the message before.
#def msg_seek(handle,index): none // Retrieves information of message with the given index.
#def msg_getlr(msgbase, userID): integer // Returns last read message
#def msg_setlr(msgbase, userID, userHandle, lastread) // Sets the last read pointer of the user.
#def msg_stats(msgbase): tuple // This function works by passing the handle of an already opened message base (msg_open).
#def onekey(chars,echo): char // You can use this function to accept specific keypresses from the user.
#def purgeinput(): none // This clears out any input currently in Mystic's input buffer.
#def setpinfo(byte, string): none // Set the prompt info value for <byte> to the <text> in string.
#def setprompt(number, text): none // This sets a theme prompt to the value of text for the duration of the user's session or until they change or reload the theme.
#def shutdown(): boolean // Checks if the user has dropped connection. If so returns True.
#def stuffkey(text): none // This function adds text into the input buffer as if the user had typed it.
#def sysoplog(level, text): none // Logs a line to the node's log using level as the loglevel.
#def termsize(): tuple // Returns the x and y size of the user's terminal.
#def textattr(): integer // Returns the current text color attribute. The number is between 0-255.
#def textcolor(attribute): none // Sets the current text color to <attribute>
#def upuser(seclevel): none // Updates the current user's security profile to <seclevel>, which includes access flags, time left, daily limits, etc.  Ex: upuser(50)
#def wherex(): integer // Returns the current X location of the cursor
#def wherey(): integer // Returns the current Y location of the cursor
#mci AG // User's age in years
#mci AS // User's auto signature (On or Off)
#mci AV // User's chat availability for user to user chat (Yes or No)
#mci BD // User's baud rate (returns TELNET or LOCAL) (may be removed)
#mci BI // User's birth date in their selected date format
#mci BN // BBS name from System configuration
#mci CM // User's full screen node chat setting (On or Off)
#mci CS // User's total number of calls to the BBS
#mci CT // User's total number of calls to the BBS today
#mci DA // Current date in the user's selected date format
#mci DK // User's total downloads in kilobytes
#mci DL // User's total number of downloaded files
#mci DT // User's total number of downloads today
#mci FB // User's current file base name
#mci FG // User's current file group name
#mci FK // User's total uploads in kilobytes 
#mci FO // User's first call date in their selected date format
#mci FS // User's file group (short name)
#mci FT // Total number of files in current file base (dynamic)
#mci FU // User's total number of files uploaded
#mci HK // User's hotkey setting (On or Off)
#mci IL // User's node status invisibility (On or Off)
#mci KT // User's downloads in kilobytes today
#mci LO // User's last call date in their selected date format
#mci MB // User's current message base name
#mci MD // Menu description of the current menu (from menu flags)
#mci ME // User's total number of e-mails sent
#mci MF // Shows number of draft messages saved for the current user
#mci MG // User's current message group name
#mci ML // User's lightbar message index setting (On or Off)
#mci MN // Network address of current message base
#mci MP // User's total number of message posts
#mci MS // User's message group (short name)
#mci MT // Total number of messages in current message base (dynamic)
#mci MU // Total unread personal messages *
#mci MW // Total personal messages *
#mci ND // Current node number
#mci NE // Minutes until next BBS-type event
#mci OS // Operating system (Windows, Linux, Raspberry Pi, etc)
#mci PC // User's current post to calls ratio
#mci PW // Configured number of days before required password change
#mci QA // User's selected archive format (QWK, etc)
#mci QE // User's Generate QWKE setting (Yes or No)
#mci QL // User's Include QWK file listing setting (Yes or No)
#mci RD // User's download ratio for their current security level (files)
#mci RK // User's download ratio for their current security level (kilobytes)
#mci SB // User's max allowed minutes in time bank for current security level
#mci SC // User's max calls per day allowed for current security level
#mci SD // User's current security level description
#mci SK // User's max allowed download kilobytes per day for current sec level
#mci SL // User's current security level number
#mci SN // Configured Sysop name
#mci SP // Configured post call ratio for the current security level
#mci ST // Configured allowed minutes per day for current security level
#mci SX // User's max allowed downloaded files per day for current security level
#mci TB // User's timebank minutes
#mci TC // Total number of calls to the BBS system
#mci TE // User's terminal emulation (Ansi or Ascii)
#mci TI // Current time of day in 12 hour format
#mci TL // User's time left in minutes
#mci TO // User's time spent online this session (in minutes)
#mci U# // User's number (aka permanent user index)
#mci U1 // User's optional data answer for question #1
#mci U2 // User's optional data answer for question #1
#mci U3 // User's optional data answer for question #1
#mci UA // User's address
#mci UB // User's file listing type (Normal or Lightbar)
#mci UC // User's city, state
#mci UD // User's data phone number
#mci UE // User's message editor type (Line, Full, or Ask)
#mci UF // User's Date input format (MM/DD/YY, DD/MM/YY, YY/DD/MM)
#mci UG // User's gender (Male or Female)
#mci UH // User's handle (alias)
#mci UI // User's User information field
#mci UJ // User's message reader type (Normal or Lightbar)
#mci UK // User's email address
#mci UL // User's selected theme description
#mci UM // User's lightbar message index setting (On of Off)
#mci UN // User's real name
#mci UO // User's country of origin (as detected by IP/Country blocking)
#mci UP // User's Home phone number
#mci UQ // User's full screen editor quote mode (Standard or Lightbar)
#mci US // User's screen size lines (ie 25)
#mci UX // User's computer/router/internet host name
#mci UY // User's IP address
#mci UZ // User's zip (postal) code  
#mci VR // Mystic BBS version number
#mci XD // Days left before the user's account expires (or 0 if none)
#mci XS // Security level in which the user's account will expire to
#mci 00 // Sets the current foreground to Black
#mci 01 // Sets the current foreground to Dark Blue
#mci 02 // Sets the current foreground to Dark Green
#mci 03 // Sets the current foreground to Dark Cyan
#mci 04 // Sets the current foreground to Dark Red
#mci 05 // Sets the current foreground to Dark Magenta
#mci 06 // Sets the current foreground to Brown
#mci 07 // Sets the current foreground to Grey
#mci 08 // Sets the current foreground to Dark Grey
#mci 09 // Sets the current foreground to Light Blue
#mci 10 // Sets the current foreground to Light Green
#mci 11 // Sets the current foreground to Light Cyan
#mci 12 // Sets the current foreground to Light Red
#mci 13 // Sets the current foreground to Light Magenta
#mci 14 // Sets the current foreground to Yellow
#mci 15 // Sets the current foreground to White
#mci 16 // Sets the current background to Black
#mci 17 // Sets the current background to Blue
#mci 18 // Sets the current background to Green
#mci 19 // Sets the current background to Cyan
#mci 20 // Sets the current background to Red
#mci 21 // Sets the current background to Magenta
#mci 22 // Sets the current background to Brown
#mci 23 // Sets the current background to Grey
#mci 24 // Sets the current background to Dark Grey
#mci 25 // Sets the current background to Light Blue
#mci 26 // Sets the current background to Light Green
#mci 27 // Sets the current background to Light Cyan
#mci 28 // Sets the current background to Light Red
#mci 29 // Sets the current background to Light Magenta
#mci 30 // Sets the current background to light Yellow
#mci 31 // Sets the current background to light White
#mci $C##  // Centers the value of the next display code with a width of ##
#mci $D##C // Duplicates character C ## times
#mci $L##  // Left pad the next display code with spaces to ## characters
#mci $R##  // Right pad the next display code with spaces to ## characters
#mci $X##C // Duplicate character C until column ##
#mci $c##C // Centers the value of the next display with a width of ## using character C
#mci $l##C // Left pad the next display code with character <C> to ## characters
#mci $r##C // Right pad the next display code with character <C> to ## chars
#mci PD    // Pads with spaces the next MCI code value result
#mci [A## // Move the cursor up ## lines
#mci [B## // Move the cursor down ## lines
#mci [C## // Move the cursor forward (to the right) ## columns
#mci [D## // Move the cursor backwards (to the left) ## columns
#mci [K   // Clear from the current cursor position to the end of the line
#mci [L   // Move cursor and erase data backwards from current column to column ##
#mci [X## // Move cursor to X coordinate ##
#mci [Y## // Move cursor to Y coordinate ##
#mci [0   // Hide cursor (if terminal supports it)
#mci [1   // Show cursor (if terminal supports it)
#mci BS   // Sends 1 destructive backspace sequence (ASCII 8-32-8)
#mci CL   // Clears the screen (ANSI 1,1 locate and [2J or ASCII 12)
#mci CN   // Turns iCE colors OFF (if terminal supports it)
#mci CY   // Turns iCE colors ON (if terminal supports it)
#mci CR   // Send a carrage return and line feed (move to next line)
#mci RA   // Restore the saved text attribute color
#mci RS   // Restore the saved user's terminal screen
#mci SA   // Save the current text attribute color
#mci SS   // Save the entire user's terminal screen
#mci -N   // Forces the next Yes/No prompt to default to a No answer
#mci -Y   // Forces the next Yes/No prompt to default to a Yes answer
#mci IF   // Turns off the input field background color for the next input prompt.
#mci IB   // Turns off input barrier for the next string input
#mci IN## // Sets the scrolling input field size for the next input prompt to ## characters.
#mci IS## // Limits the actual maximum number of characters allow for an input prompt to ## characters.
#box #I<header>#<notification># // Box with no pause and screen restore
#box #B<header>#<notification># // Notification box, with OK button and screen restore
#mci AA   // Used in display files to enable aborting of the display file
#mci AO   // Used in display files to disable aborting of the display file
#mci BE   // Sends a ^G character to the terminal (beep code on some terms)
#mci DE   // Delay for half a second
#mci PA   // Send the pause prompt and wait for a key to be pressed
#mci PB   // Purge the current input buffer
#mci PI   // Display a pipe symbol (|)
#mci CH   // Prints out the character after (|CD| prints a pipe)
#mci PN   // Wait for a key to be pressed without prompting
#mci PO   // Used in display files to disable pausing for that display file
#mci QO   // Replaced with a randomly generated Quote of the Day
#mci RP## // Sets the internal screen pause line counter to ##
#mci XX   // Returns no value
#mci DF<file>| // Send display file <file> Example: |DFmyansi|
#mci DI## // Sets the baud rate of the current display file, 00 // 99 
#acs Ax // Check the user's age.
#acs Dx // Check if a user has a certain flag toggled ON in their SECOND set of flags.
#acs Ex // Check the user's current graphics mode.
#acs Fx // Check if a user has a certain flag toggled ON in their FIRST set of flags.
#acs Gx // Check if a user is in a certain message group.
#acs Hx // Check if a user is accessing a command at a certain hour.
#acs Mx // Check if a user is access a command at a certain minute.
#acs Nx // Check if a user is online a certain node number.
#acs OA // Check the status of the user's node message availability.
#acs OC // Check if it is the user's first call into the BBS.
#acs OF // Returns TRUE if its the user's first call today
#acs OI // Check if a user's node status is invisible to other nodes.
#acs OF // Check if its the user's first connection of the day today.
#acs OK // Check the result of the last called Boolean menu command.
#acs OM // Check if the user has System Operator access to the current message base, or is the owner of the current message
#acs ON // This command is True if the last message new scan had new messages read by the user.
#acs OP // Check the status of the user's post / call ratio.
#acs OS // This command is true when the user is connected via a securely encrypted connection to the BBS, such as SSH.
#acs OV // Returns True if the user has validated their e-mail address
#acs OY // Returns True if the last new message scan had new personal messages from the user.
#acs O1 // Returns True if the user posted during this call
#acs O2 // Returns True if user sent local e-mail during this call
#acs O3 // Returns True if user uploaded a file during this call
#acs O4 // Returns True if the user downloaded during this call
#acs Sx // Check if a user meets a certain security level.
#acs Tx // Check if a user has at least X minutes remaining in online time.
#acs Ux // Check a user's permanent user number
#acs Wx // Check the day of the week, where X is the day number (0 being Sunday and 6 being Saturday)
#acs X# // Check the columns of a user's terminal size, where # is the number of columns.
#acs Zx // Check if a user is in a certain File Group.
