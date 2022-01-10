/**
* *******************************************************************************
* *******************************************************************************
*/
component {

	// APPLICATION CFC PROPERTIES
	this.name               = "ColdBoxTestingSuite" & hash( getCurrentTemplatePath() );
	this.sessionManagement  = true;
	this.sessionTimeout     = createTimespan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimespan( 0, 0, 15, 0 );
	this.setClientCookies   = true;

	// Create testing mapping
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );

	// The application root
	rootPath                 = reReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ] = rootPath;

	// UPDATE THE NAME OF THE MODULE IN TESTING BELOW
	request.MODULE_NAME = "MockDataCFC";

	// The module root path
	moduleRootPath = reReplaceNoCase(
		this.mappings[ "/root" ],
		"#request.module_name#(\\|/)test-harness(\\|/)",
		""
	);
	this.mappings[ "/moduleroot" ]            = moduleRootPath;
	this.mappings[ "/#request.MODULE_NAME#" ] = moduleRootPath & "#request.MODULE_NAME#";

}
