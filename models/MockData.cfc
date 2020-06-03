/**
 * Our Mocking Data CFC
 * Please review the readme.md for instructions on usage.
 */
component {

	// Param default URL method if running cfc directly
	param name="url.method" default="mock";

	// Defaults used for data, may move to a file later
	variables.fNames = [
		"Alexia",
		"Alice",
		"Amy",
		"Ana",
		"Andy",
		"Barry",
		"Bob",
		"Charlie",
		"Clara",
		"Clarence",
		"Danny",
		"Delores",
		"Erin",
		"Esteban",
		"Fernando",
		"Frank",
		"Gary",
		"Gene",
		"George",
		"Heather",
		"Jacob",
		"Jorge",
		"Jose",
		"Juan",
		"Leah",
		"Lisa",
		"Lucas",
		"Lucia",
		"Luis",
		"Lynn",
		"Maria",
		"Mateo",
		"Nick",
		"Noah",
		"Pablo",
		"Ray",
		"Ricardo",
		"Roger",
		"Romeo",
		"Scott",
		"Todd",
		"Veronica"
	];

	variables.lNames = [
		"Anderson",
		"Bearenstein",
		"Boudreaux",
		"Camden",
		"Castro",
		"Clapton",
		"Degeneres",
		"Elias",
		"Flores",
		"Hill",
		"Lainez",
		"Lopez",
		"Madeiro",
		"Maggiano",
		"Marquez",
		"Messi",
		"Moneymaker",
		"Padgett",
		"Pilato",
		"Reyes",
		"Rodrigues",
		"Rogers",
		"Sanabria",
		"Sandoval",
		"Segovia",
		"Sharp",
		"Smith",
		"Stroz",
		"Tobias",
		"Zelda"
	];

	variables.webDomains = [
		"adobe.com",
		"aol.com",
		"apple.com",
		"awesome.com",
		"box.com",
		"box.io",
		"box.net",
		"boxing.com",
		"example.sv.com",
		"example.co.uk",
		"example.jp",
		"example.edu",
		"example.com",
		"example.net",
		"email.com",
		"mail.io",
		"gmail.com",
		"google.com",
		"microsoft.com",
		"msn.com",
		"ortus.io",
		"ortus.com",
		"sample.io",
		"sample.edu",
		"sample.com",
		"test.com"
	];

	variables.lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

	variables.sentences = [
		"Bacon ipsum dolor amet bacon biltong brisket sirloin kielbasa",
		"hock beef landjaeger boudin alcatra",
		"sausage beef beef ribs pancetta pork chop doner short ribs",
		"brisket alcatra shankle pork chop, turducken picanha",
		"Venison doner leberkas turkey ball tip tongue"
	];

	variables.words = listToArray(
		"Aeroplane,Air,Aircraft,Airforce,Airport,Album,Alphabet,Apple,Arm,Army,Baby,Baby,Backpack,Balloon,Banana,Bank,Barbecue,Bathroom,Bathtub,Bed,Bed,Bee,Bible,Bible,Bird,Bomb,Book,Boss,Bottle,Bowl,Box,Boy,Brain,Bridge,Butterfly,Button,Cappuccino,Car,Car-race,Carpet,Carrot,Cave,Chair,Chess,Chief,Child,Chisel,Chocolates,Church,Church,Circle,Circus,Circus,Clock,Clown,Coffee,Coffee-shop,Comet,CompactDisc,Compass,Computer,Crystal,Cup,Cycle,DataBase,Desk,Diamond,Dress,Drill,Drink,Drum,Dung,Ears,Earth,Egg,Electricity,Elephant,Eraser,Explosive,Eyes,Family,Fan,Feather,Festival,Film,Finger,Fire,Floodlight,Flower,Foot,Fork,Freeway,Fruit,Fungus,Game,Garden,Gas,Gate,Gemstone,Girl,Gloves,God,Grapes,Guitar,Hammer,Hat,Hieroglyph,Highway,Horoscope,Horse,Hose,Ice,Ice-cream,Insect,Jetfighter,Junk,Kaleidoscope,Kitchen,Knife,Leather,Leg,Library,Liquid,Magnet,Man,Map,Maze,Meat,Meteor,Microscope,Milk,Milkshake,Mist,Money,Monster,Mosquito,Mouth,Nail,Navy,Necklace,Needle,Onion,PaintBrush,Pants,Parachute,Passport,Pebble,Pendulum,Pepper,Perfume,Pillow,Plane,Planet,Pocket,Post-office,Potato,Printer,Prison,Pyramid,Radar,Rainbow,Record,Restaurant,Rifle,Ring,Robot,Rock,Rocket,Roof,Room,Rope,Saddle,Salt,Sandpaper,Sandwich,Satellite,School,Ship,Shoes,Shop,Shower,Signature,Skeleton,Slave,Snail,Software,Solid,SpaceShuttle,Spectrum,Sphere,Spice,Spiral,Spoon,Sports-car,Spotlight,Square,Staircase,Star,Stomach,Sun,Sunglasses,Surveyor,Swimming,Sword,Table,Tapestry,Teeth,Telescope,Television,Tennis,Thermometer,Tiger,Toilet,Tongue,Torch,Torpedo,Train,Treadmill,Triangle,Tunnel,Typewriter,Umbrella,Vacuum,Vampire,Videotape,Vulture,Water,Weapon,Web,Wheelchair,Window,Woman,Worm,X-ray"
	);

	variables.baconlorem = arrayToList( variables.sentences );

	variables.defaults = [
		"age",
		"all_age",
		"baconlorem",
		"date",
		"datetime",
		"email",
		"fname",
		"gps",
		"lname",
		"name",
		"num",
		"sentence",
		"ssn",
		"tel",
		"uuid",
		"words"
	];

	variables.extensions = [
		".cfm",
		".css",
		".doc",
		".docx",
		".jpg",
		".js",
		".htm",
		".html",
		".pdf",
		".php",
		".png",
		".ppt",
		".pptx",
		".xls",
		".xlsx"
	];

	variables.imageExtensions = [
		".svg",
		".gif",
		".jpg",
		".jpeg",
		".pdf",
		".png"
	];

	variables.RESERVED_ARGUMENTS = [ "$num", "$returnType", "$type" ];

	/**
	 * This function is the remote entry point for our service or data calls
	 * The incoming arguments are evaluated for mocking data services.
	 */
	remote function mock() returnformat="json"{
		// cfheader( name="Content-Type", value="text/html" );

		// Did they specify how many they want?
		if ( !arguments.keyExists( "$num" ) ) {
			arguments.$num = 10;
		}

		// Did they specify the return type?
		if ( !arguments.keyExists( "$returnType" ) ) {
			arguments.$returnType = "array";
		}

		// If num is not numeric, then it must be our random number generator
		if ( !isNumeric( arguments.$num ) && arguments.$num.find( ":" ) > 0 ) {
			var parts = arguments.$num.listToArray( ":" );
			if ( !listFindNoCase( "rnd,rand", parts[ 1 ] ) ) {
				throw( "Invalid num prefix sent. Must be 'rnd' or 'rand'" );
			}
			// format is rnd:10 which means, from 1 to 10
			if ( parts.len() == 2 ) {
				arguments.$num = randRange( 1, parts[ 2 ] );
			} else {
				arguments.$num = randRange( parts[ 2 ], parts[ 3 ] );
			}
		}

		// Determine incoming models from argument definition excluding reserved args
		var aFieldModels = [];
		for ( var key in arguments ) {
			if ( !variables.RESERVED_ARGUMENTS.findNoCase( key ) ) {
				aFieldModels.append( { name : key, type : arguments[ key ] } );
			}
		}

		// Did we receive an explicit array of values type?
		if ( arguments.keyExists( "$type" ) ) {
			var result = [];
			for ( var i = 1; i <= arguments.$num; i++ ) {
				result.append( generateFakeData( arguments[ "$type" ], i ) );
			}
		}
		// Then we go on return types for return formats
		else if ( arguments.$returnType == "array" ) {
			// Array of struct objects
			var result = [];
			for ( var i = 1; i <= arguments.$num; i++ ) {
				result.append( generateNewItem( aFieldModels, i ) );
			}
		} else {
			// Struct objects
			var result = generateNewItem( aFieldModels, 0 );
		}

		// If in Service mode, then add headers
		if ( cgi.script_name contains "MockData.cfc" ) {
			cfheader(
				name ="Content-Type",
				value="application/json"
			);
			// CORS for web service calls
			cfheader(
				name ="Access-Control-Allow-Origin",
				value="*"
			);
		}

		return result;
	}

	/***************************** PRIVATE ****************************************/

	/**
	 * Check if an incoming type exists in our default types
	 * @target The target to check
	 */
	private boolean function isDefault( required target ){
		return defaults.findNoCase( target ) > 0;
	}

	/**
	 * Generate the fake data according to incoming type
	 *
	 * @type The valid incoming fake data type
	 * @index The index location of the fake iteration
	 */
	private function generateFakeData( required type, required index ){
		// Supplier closure or lambda
		if ( isClosure( arguments.type ) || isCustomFunction( arguments.type ) ) {
			return arguments.type( arguments.index );
		}
		if ( arguments.type == "autoincrement" ) {
			return arguments.index;
		}
		if ( arguments.type == "ipaddress" ) {
			return generateIpAddress();
		}
		if ( arguments.type.findNoCase( "string" ) == 1 ) {
			return generateString( arguments.type );
		}
		if ( arguments.type == "uuid" ) {
			return createUUID();
		}
		if ( arguments.type == "name" ) {
			return generateFirstName() & " " & generateLastName();
		}
		if ( arguments.type == "fname" ) {
			return generateFirstName();
		}
		if ( arguments.type == "lname" ) {
			return generateLastName();
		}
		if ( arguments.type == "age" ) {
			return randRange( 18, 75 );
		}
		if ( arguments.type == "all_age" ) {
			return randRange( 1, 100 );
		}
		if ( arguments.type == "email" ) {
			return generateEmail();
		}
		if ( arguments.type == "imageurl" ) {
			return generateImageUrl();
		}
		if ( arguments.type == "imageurl_http" ) {
			return generateImageUrl( httpOnly = true );
		}
		if ( arguments.type == "imageurl_https" ) {
			return generateImageUrl( httpsOnly = true );
		}
		if ( arguments.type == "url" ) {
			return generateUrl();
		}
		if ( arguments.type == "url_http" ) {
			return generateUrl( httpOnly = true );
		}
		if ( arguments.type == "url_https" ) {
			return generateUrl( httpsOnly = true );
		}
		if ( arguments.type == "website" ) {
			return generateWebsite();
		}
		if ( arguments.type == "website_http" ) {
			return generateWebsite( httpOnly = true );
		}
		if ( arguments.type == "website_https" ) {
			return generateWebsite( httpsOnly = true );
		}
		if ( arguments.type == "ssn" ) {
			return generateSSN();
		}
		if ( arguments.type == "tel" ) {
			return generateTelephone();
		}
		if ( arguments.type == "date" ) {
			return generateDateRange();
		}
		if ( arguments.type == "datetime" ) {
			return generateDateRange( showTime = true );
		}
		if ( arguments.type.findNoCase( "num" ) == 1 ) {
			return generateNumber( arguments.type );
		}
		if ( arguments.type.findNoCase( "oneof" ) == 1 ) {
			return generateOneOf( arguments.type );
		}
		if ( arguments.type.findNoCase( "lorem" ) == 1 ) {
			return generateLorem( arguments.type );
		}
		if ( arguments.type.findNoCase( "baconlorem" ) == 1 ) {
			return generateLorem( arguments.type );
		}
		if ( arguments.type.findNoCase( "sentence" ) == 1 ) {
			return generateSentences( arguments.type );
		}
		if ( arguments.type.findNoCase( "words" ) == 1 ) {
			return generateWords( arguments.type );
		}

		return "No Type ['#arguments.type#'] Found";
	}

	/**
	 * Generate a new mocked item
	 * @fieldModels A struct of name and type of the model to generate
	 * @index The numerical index of the item being generated
	 */
	private struct function generateNewItem(
		required array fieldModels,
		required index
	){
		var result = {};
		arguments.fieldModels.each( function( field ){
			// Verify the field struct has a name, else generate it
			if ( !field.keyExists( "name" ) ) {
				field.name = "field" & i;
			}

			// if we are a default, that is our type, otherwise string
			if (
				isSimpleValue( field.type )
				&&
				!field.type.len()
				&&
				isDefault( field.name )
			) {
				field.type = field.name;
			}

			// Determine the type of field model
			if ( isStruct( field.type ) ) {
				// Bind the return type as a struct
				field.type.$returnType = "struct";
				// The field model defines a single object relationship
				result[ field.name ]   = mock( argumentCollection = field.type );
			} else if ( isArray( field.type ) ) {
				// The field model defines a one to many relationship
				result[ field.name ] = mock( argumentCollection = field.type[ 1 ] );
			} else {
				// Generate the fake data
				result[ field.name ] = generateFakeData( field.type, index );
			}
		} );

		return result;
	}

	/**
	 * Get the parts count from the incoming target type which can be
	 * - type:max
	 * - type:min:max
	 */
	private function getPartCounts( required target ){
		// Calculate counts
		var parts = target.listToArray( ":" );

		if ( parts.len() == 2 ) {
			return parts[ 2 ];
		} else {
			return randRange( parts[ 2 ], parts[ 3 ] );
		}
	}

	/********************************* GENERATORS ********************************/

	/**
	 * Generate random strings according to the type
	 *
	 * The type can be of the following permutations pattern: string[-(secure|alpha|numeric):max]
	 *
	 * string - Generate 10 alphanumeric characters
	 * string:max - Generate {max} count of alphanumeric characters
	 * string-numeric - Generate numeric characters
	 * string-alpha - Generate alpha characters
	 * string-secure - Generate alpha+numeric+secure characters
	 *
	 * @type This can be string, or string:size
	 */
	private function generateString( required type ){
		// Generation data
		var alpha = listToArray(
			"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
		);
		var numeric = listToArray( "0,1,2,3,4,5,6,7,8,9" );
		var secure  = listToArray( "!,@,$,%,&,*,-,_,=,+,?,~" );

		// The return type to use: alphanumeric (default), alpha, numeric, secure
		if ( arguments.type.findNoCase( "string-alphanumeric" ) ) {
			var returnType = "alphanumeric";
		} else if ( arguments.type.findNoCase( "string-numeric" ) ) {
			var returnType = "numeric";
		} else if ( arguments.type.findNoCase( "string-alpha" ) ) {
			var returnType = "alpha";
		} else if ( arguments.type.findNoCase( "string-secure" ) ) {
			var returnType = "secure";
		} else {
			var returnType = "alphanumeric";
		}

		// Check incoming type, if default of `string` default to 10 chars
		if ( !arguments.type.find( ":" ) ) {
			arguments.type &= ":10";
		}

		// Prepare Data List
		switch ( returnType ) {
			case "alpha": {
				var dataList = alpha;
				break;
			}
			case "numeric": {
				var dataList = numeric;
				break;
			}
			case "secure": {
				var dataList = alpha.append( numeric.append( secure, true ), true );
				break;
			}
			default: {
				var dataList = alpha.append( numeric, true );
			}
		}

		// Iterate and create string
		var result = "";
		var count  = getToken( arguments.type, 2, ":" );
		for ( var i = 1; i <= count; i++ ) {
			result &= dataList[ randRange( 1, dataList.len() ) ];
		}

		return result;
	}

	/**
	 * Generate random words
	 *
	 * @type This can be words, or words:count
	 */
	private function generateWords( required type ){
		if ( type == "words" ) {
			return words[ randRange( 1, arrayLen( words ) ) ];
		}
		if ( type.find( ":" ) > 1 ) {
			var parts  = type.listToArray( ":" );
			var result = "";
			var count  = "";
			if ( parts.len() == 2 ) {
				count = parts[ 2 ];
			} else {
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for ( var i = 0; i < count; i++ ) {
				result &= words[ randRange( 1, arrayLen( words ) ) ] & " ";
			}
			return result;
		}
	}

	/**
	 * Generate sentences
	 */
	private function generateSentences( required type ){
		if ( arguments.type == "sentence" ) {
			return sentences[ randRange( 1, arrayLen( sentences ) ) ];
		}
		if ( arguments.type.find( ":" ) > 1 ) {
			var parts  = arguments.type.listToArray( ":" );
			var result = "";
			var count  = "";
			if ( parts.len() == 2 ) {
				count = parts[ 2 ];
			} else {
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for ( var i = 0; i < count; i++ ) {
				result &= sentences[ randRange( 1, arrayLen( sentences ) ) ] & "\n\n";
			}
			return result;
		}
	}

	/**
	 * Generate Lorem
	 * @type The target type
	 */
	private function generateLorem( required type ){
		if ( arguments.type == "lorem" ) {
			return lorem;
		}
		if ( arguments.type == "baconlorem" ) {
			return baconlorem;
		}

		// Restricting by convention
		if ( type.find( ":" ) > 1 ) {
			var parts       = type.listToArray( ":" );
			var result      = "";
			var count       = "";
			var targetLorem = ( arguments.type == "lorem" ? variables.lorem : variables.baconlorem );

			if ( parts.len() == 2 ) {
				count = parts[ 2 ];
			} else {
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for ( var i = 0; i < count; i++ ) {
				result &= targetLorem & "\n\n";
			}
			return result;
		}
	}

	/**
	 * generate one of functions
	 */
	private function generateOneOf( required type ){
		// Support oneof:male:female, ie, pick a random one
		var items = arguments.type.listToArray( ":" );
		items.deleteAt( 1 );
		return items[ randRange( 1, items.len() ) ];
	}

	/**
	 * Generate a random number
	 */
	private function generateNumber( required type ){
		// Support num, num:10, num:1:10
		if ( arguments.type == "num" ) {
			return randRange( 1, 10 );
		}
		if ( arguments.type.find( ":" ) > 1 ) {
			var parts = arguments.type.listToArray( ":" );
			if ( parts.len() == 2 ) {
				return randRange( 1, parts[ 2 ] );
			}
			return randRange( parts[ 2 ], parts[ 3 ] );
		}
	}

	/**
	 * Generate telephone
	 */
	private function generateTelephone(){
		return "(" & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & ") " &
		randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & "-" &
		randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 );
	}

	/**
	 * Generate SSN
	 */
	private function generateSSN(){
		return randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & "-" &
		randRange( 1, 9 ) & randRange( 1, 9 ) & "-" &
		randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 );
	}

	/**
	 * Generate an email
	 */
	private function generateEmail(){
		var fname       = generateFirstName().toLowerCase();
		var lname       = generateLastName().toLowerCase();
		var emailPrefix = fname.charAt( 1 ) & lname;
		return emailPrefix & "@" & variables.webDomains[ randRange( 1, variables.webDomains.len() ) ];
	}

	/**
	 * Generate a random image URL including a random protocol
	 *
	 * @httpOnly Only do http sites, mutex with httpsOnly
	 * @httpsOnly Only do https sites, mutex with httpOnly
	 */
	private function generateImageUrl( boolean httpOnly, boolean httpsOnly ){
		arguments.imageExtensions = true;
		return generateUrl( argumentCollection = arguments );
	}

	/**
	 * Generate a random URL including a random protocol
	 *
	 * @httpOnly Only do http sites, mutex with httpsOnly
	 * @httpsOnly Only do https sites, mutex with httpOnly
	 */
	private function generateUrl(
		boolean httpOnly,
		boolean httpsOnly,
		boolean imageExtensions = false
	){
		var randomPaths = generateWords( "words:1:#randRange( 1, 5 )#" )
			.listToArray( " " )
			.toList( "/" )
			.lcase();

		var randomHash = "";
		if ( ( randRange( 1, 10 ) % 2 ) ) {
			randomHash = "###generateWords( "words" )#";
		}

		var randomFile = "";
		if ( ( randRange( 1, 10 ) % 2 ) ) {
			randomFile = generateWords( "words" );
		}

		if ( arguments.imageExtensions ) {
			randomFile &= variables.imageExtensions[ randRange( 1, variables.imageExtensions.len() ) ];
		} else {
			randomFile &= variables.extensions[ randRange( 1, variables.extensions.len() ) ];
		}

		return generateWebsite( argumentCollection = arguments ) & "/" & randomPaths & randomFile & randomHash;
	}

	/**
	 * Generate a random website including random protocol
	 *
	 * @httpOnly Only do http sites, mutex with httpsOnly
	 * @httpsOnly Only do https sites, mutex with httpOnly
	 */
	private function generateWebsite( boolean httpOnly, boolean httpsOnly ){
		var prefix = "http";
		if ( !isNull( arguments.httpsOnly ) ) {
			prefix = "https";
		}
		if ( isNull( arguments.httpOnly ) && isNull( arguments.httpsOnly ) ) {
			prefix &= ( ( randRange( 1, 10 ) % 2 ) ? "s" : "" );
		}

		var webPart = "";
		if ( ( randRange( 1, 10 ) % 2 ) ) {
			webPart = "www.";
		}

		return "#prefix#://" & webpart & variables.webDomains[ randRange( 1, variables.webDomains.len() ) ];
	}

	/**
	 * Generate an ip address
	 */
	private function generateIpAddress(){
		return "#randRange( 0, 255 )#.#randRange( 0, 255 )#.#randRange( 0, 255 )#.#randRange( 0, 255 )#";
	}

	/**
	 * Generate a first name
	 */
	private function generateFirstName(){
		return fNames[ randRange( 1, fNames.len() ) ];
	}

	/**
	 * Generate a last name
	 * @return {[type]} [description]
	 */
	private function generateLastName(){
		return lNames[ randRange( 1, lNames.len() ) ];
	}

	/**
	 * Genereate a random data range
	 * @from 		The date time start
	 * @to 			The end date else defaults to today
	 * @showTime 	Show time in the data
	 * @dateFormat  The date formatting to use
	 * @timeFormat 	The time formmating to use
	 */
	private function generateDateRange(
		date from  = "#createDateTime( "2010", "01", "01", "0", "0", "0" )#",
		date to    = "#now()#",
		showTime   = false,
		dateFormat = "medium",
		timeFormat = "medium"
	){
		var timeDifference = dateDiff( "s", arguments.from, arguments.to );
		var timeIncrement  = createTimespan(
			0,
			0,
			0,
			randRange( 0, timeDifference )
		);
		var result = arguments.from + timeIncrement;

		if ( arguments.showTime ) {
			return dateFormat( result, arguments.dateFormat ) & " " & timeFormat( result, arguments.timeFormat );
		} else {
			return dateFormat( result, arguments.dateFormat );
		}
	}

}
