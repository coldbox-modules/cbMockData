<cfscript>
calculateHashes = function(){
	var models = directoryList( "./", false, "query", "*.cfc", "DateLastModified desc" );
	var modelsHash = hash( serializeJSON( models ) );
	
	var tests = directoryList( "./tests/specs", true, "query", "*.cfc", "DateLastModified desc" );
	var testsHash = hash( serializeJSON( tests ) );

	return modelsHash & testsHash;
}

changeDetected = function(){
	if( changeHash == calculateHashes() ){
		return false;
	} 
	changeHash = calculateHashes();
	return true;
}

printWatching = function(){
	print
		.printLine( "" )
		.printRedLine( "Watching Files..." )
		.toConsole();
}

changeHash 	= calculateHashes();
print 		= $shell.getWireBox().getInstance( "PrintBuffer" );
tries 		= 1;
watcherRun 	= true;

printWatching();

try {
	threadName = 'watcher#createUUID()#';
	thread action="run" name="#threadname#" priority="HIGH"{
		try{
			// Run until we exit out of the watcher
			while( variables.watcherRun ){
				// Verify if we have a change
				if( changeDetected() ){
					// Advice it
					print.printBlueLine( "Changes detected, Executing commands..." )
						.println()
						.toconsole();
					
					SystemOutput( "Change Detected..." );
					// Run tests first and wait
					$shell.callCommand( "testbox run" );
					tries++;

					printWatching();
				} else {
					//SystemOutput( "Sleeping..." );
					// Sleep and test again.
					sleep( 500 );
				}
			}
		} catch( any e ) {
			// Print out error message from exception and continue watching
			print.printRedBoldLine( "An exception has ocurred: #e.message# #e.detail#" );
			
			print.println( e.stacktrace );

			print.println()
				.printGreenLine( "Starting watcher again..." )
				.println()
				.toConsole();
		}
	} // end thread
	
	while( true ){
		// Wipe out prompt so it doesn't redraw if the user hits enter
		$shell.getReader().setPrompt( '' );	
		// Detect user pressing Ctrl-C
		// Any other characters captured will be ignored
		var line = $shell.getReader().readLine();
		if( line == 'q' ) {
			break;
		} else {
			print.boldGreenLine( 'To exit press Ctrl-C or "q" followed the enter key.' ).toConsole();
		}
	}
	

// user wants to exit, they've pressed Ctrl-C 
} catch ( jline.console.UserInterruptException e ) {
	// make sure the thread exits
	watcherRun = false;
	// Wait until the thread finishes its last draw
	thread action="join" name=threadName;
// Something horrible went wrong
} catch ( any e ) {
	// make sure the thread exits
	watcherRun = false;
	// Wait until the thread finishes its last draw
	thread action="join" name=threadName;
	rethrow;
} finally{
	$shell.setPrompt();
}

// make sure the thread exits
watcherRun = false;
// Wait until the thread finishes its last draw
thread action="join" name=threadName;

</cfscript>