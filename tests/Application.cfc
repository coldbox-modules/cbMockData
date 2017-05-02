/**
* Copyright Since 2005 Ortus Solutions, Corp
* www.ortussolutions.com
**************************************************************************************
*/
component{
	this.name = "MockDataCFC Test Suite" & hash( getCurrentTemplatePath() );

	// any mappings go here, we create one that points to the root called test.
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ]   		= rootPath;
	this.mappings[ "/testbox" ]   	= rootPath & "/testbox";

	// any orm definitions go here.

	// request start
	public boolean function onRequestStart( String targetPage ){
		return true;
	}
}