component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		setup();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "MockData CFC", function(){
			beforeEach( function( currentSpec ){
				variables.cbMockData = getInstance( "MockData@cbMockData" );
			} );

			it( "can be created", function(){
				expect( cbMockData ).toBeComponent();
			} );

			it( "can generate with defaults", function(){
				var r = cbMockData.mock();
				expect( r.len() ).toBe( 10 );
			} );

			it( "can generate autoincrementing IDs", function(){
				var r = cbMockData.mock( id = "autoincrement" );
				expect( r[ 1 ].id ).toBe( 1 );
				expect( r[ 10 ].id ).toBe( 10 );
			} );

			it( "can generate uuids", function(){
				var r = cbMockData.mock( id = "uuid" );
				expect( r[ 1 ].id ).toBeUUID();
			} );

			it( "can generate guids", function(){
				var r = cbMockData.mock( id = "guid" );
				expect( r[ 1 ].id ).toHaveLength( 36 );
			} );

			it( "can generate names", function(){
				var r = cbMockData.mock( name = "name" );
				expect( r[ 1 ].name ).toInclude( " " );
			} );

			it( "can generate ages", function(){
				var r = cbMockData.mock( age = "age" );
				expect( r[ 1 ].age ).toBeGTE( 18 ).toBeLTE( 75 );
			} );

			it( "can generate all ages", function(){
				var r = cbMockData.mock( age = "all_age" );
				expect( r[ 1 ].age ).toBeGTE( 1 ).toBeLTE( 100 );
			} );

			it( "can generate emails", function(){
				var r = cbMockData.mock( email = "email" );
				expect( r[ 1 ].email ).toBeEmail();
			} );

			it( "can generate ssn", function(){
				var r = cbMockData.mock( ssn = "ssn" );
				expect( r[ 1 ].ssn ).toBeSSN();
			} );

			it( "can generate telephones", function(){
				var r = cbMockData.mock( phone = "tel" );
				expect( r[ 1 ].phone ).notToBeEmpty();
			} );

			it( "can generate dates", function(){
				var r = cbMockData.mock( createdOn = "date" );
				expect( r[ 1 ].createdOn ).toBeDate();
			} );

			it( "can generate date times", function(){
				var r = cbMockData.mock( createdOn = "datetime" );
				expect( r[ 1 ].createdOn ).toBeDate();
			} );

			it( "can generate iso date times", function(){
				var r = cbMockData.mock( createdOn = "datetime-iso" );
				expect( r[ 1 ].createdOn ).toBeDate();
			} );

			it( "can generate boolean randomness", function(){
				var r = cbMockData.mock( isActive: "boolean" );
				expect( r[ 1 ].isActive ).toBeBoolean();
			} );

			it( "can generate boolean digit randomness", function(){
				var r = cbMockData.mock( isActive: "boolean-digit" );
				expect( r[ 1 ].isActive ).toBeBoolean();
			} );

			it( "can generate numbers", function(){
				var r = cbMockData.mock( value = "num" );
				expect( r[ 1 ].value ).toBeNumeric().toBeLTE( 10 );
			} );

			it( "can generate numbers with randomness", function(){
				var r = cbMockData.mock( value = "num:5" );
				expect( r[ 1 ].value ).toBeNumeric().toBeLTE( 5 );

				var r = cbMockData.mock( value = "num:5:6" );
				expect( r[ 1 ].value )
					.toBeNumeric()
					.toBeLTE( 6 )
					.toBeGTE( 5 );
			} );

			it( "can generate one ofs", function(){
				var r = cbMockData.mock( gender = "oneof:male:female" );
				expect( r[ 1 ].gender ).toMatch( "(male|female)" );
			} );

			it( "can generate lorem", function(){
				var r = cbMockData.mock( notes = "lorem" );
				expect( r[ 1 ].notes ).toinclude( "lorem" );
			} );

			it( "can generate bacon lorem", function(){
				var r = cbMockData.mock( notes = "baconlorem" );
				expect( r[ 1 ].notes ).toinclude( "bacon" );
			} );

			it( "can generate sentences", function(){
				var r = cbMockData.mock( notes = "sentence" );
				expect( r[ 1 ].notes ).notToBeEmpty();
			} );

			it( "can generate words", function(){
				var r = cbMockData.mock( notes = "words" );
				expect( r[ 1 ].notes ).notToBeEmpty();
			} );

			it( "can generate custom data", function(){
				var r = cbMockData.mock(
					test = function( index ){
						return "hello";
					}
				);
				expect( r[ 1 ].test ).toBe( "hello" );
			} );

			it( "can generate a website", function(){
				var r = cbMockData.mock( homepage = "website" );
				expect( r[ 1 ].homepage ).toBeUrl();
			} );
			it( "can generate https only websites", function(){
				var r = cbMockData.mock( homepage = "website_https" );
				r.each( function( item ){
					expect( item.homepage ).toInclude( "https" );
				} );
			} );
			it( "can generate http only websites", function(){
				var r = cbMockData.mock( homepage = "website_http" );
				r.each( function( item ){
					expect( item.homepage ).toInclude( "http:" );
				} );
			} );

			it( "can generate a url", function(){
				var r = cbMockData.mock( homepage = "url" );
				debug( r );
				expect( r[ 1 ].homepage ).toBeUrl();
			} );

			it( "can generate an image url", function(){
				var r = cbMockData.mock( homepage = "imageurl" );
				debug( r );
				expect( r[ 1 ].homepage ).toBeUrl();
			} );

			it( "can generate a string", function(){
				var r = cbMockData.mock( test = "string" );
				debug( r );
				expect( r[ 1 ].test ).toHaveLength( 10 );
			} );

			it( "can generate an alpha string", function(){
				var r = cbMockData.mock( test = "string-alpha" );
				debug( r );
				expect( r[ 1 ].test ).toHaveLength( 10 );
			} );
			it( "can generate a secure string", function(){
				var r = cbMockData.mock( test = "string-secure" );
				debug( r );
				expect( r[ 1 ].test ).toHaveLength( 10 );
			} );
			it( "can generate a numeric string", function(){
				var r = cbMockData.mock( test = "string-numeric" );
				debug( r );
				expect( r[ 1 ].test ).toHaveLength( 10 );
			} );

			it( "can generate a big string", function(){
				var r = cbMockData.mock( test = "string:200" );
				debug( r );
				expect( r[ 1 ].test ).toHaveLength( 200 );
			} );

			it( "can generate an ip address", function(){
				var r = cbMockData.mock( test = "ipaddress" );
				debug( r );
				expect( reFindNoCase( "^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$", r[ 1 ].test ) ).toBeTrue();
			} );

			it( "can generate a struct $returnType", function(){
				var r = cbMockData.mock(
					$returnType = "struct",
					test        = "string:200",
					name        = "name"
				);
				debug( r );
				expect( r ).toBeStruct().toHaveKey( "test,name" );
			} );
		} );
	}

}
