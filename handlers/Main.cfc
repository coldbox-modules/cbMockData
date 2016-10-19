/**
* My Event Handler Hint
*/
component extends="coldbox.system.EventHandler"{
	
	property name="MockData" inject="MockData@MockDataCFC";

	/**
	* Index
	*/
	any function index( event, rc, prc ){
		var inData = duplicate( rc );
		var reserved = listToArray( "event,namespaceRouting,namespace" );
		for( var key in reserved ){
			structDelete( inData, key );
		}
		var results = MockData.mock( argumentCollection=inData );
		event.renderData(
			type = "json",
			data = results
		);
	}
	
}