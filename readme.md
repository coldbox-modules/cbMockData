# MockData CFC

This is a ColdFusion version of the [MockData](https://github.com/cfjedimaster/mockdata) Node.js service. 

MockData is a simple service to generate fake JSON data via command line arguments, a JSON REST service or a Service API. The idea being that you may be offline, may not have access to an API, or simply need some fake data to test something on your front end or seed a complete database with fake data.

## Requirements

* ColdFusion 11+
* Lucee 4.5+

## Installation

Leverage CommandBox and type `box install mockdatacfc`

## Usage

Once installed you can leverage the API in different ways:

1. Put it in your ColdFusion web server and call it directly via CFC method ` new MockData().mock()`).
2. Startup a CommandBox server in the root of the package once installed (`box server start`) and execute it via port: 3000
3. Install it as a module in a ColdBox app and hit the service via `/mockdataCFC` or get access to the mocking instance via the WireBox ID: `MockData@MockDataCFC`

### Customizing the service port

To specify a port or change the port, just add it an argument to the server start command or modify the `server.json` port configuration:

```
box server start port=XXXX
```

### Getting Data

To get data from the service, point your XHR at:

```
http://localhost:3000/
```

> Note: MockData uses CORS so if you're running a virtual domain then you will still be able to hit the service.(As long as you have a decent browser.)

### Number of objects

There are 2 types of arguments you pass to the object. The first is the number of objects you want returned via the `num` argument.

```js
# service call
http://localhost:3000/?num=10

# object
var data = getInstance( "MockData@MockDataCFC" )
    .mock(
        num = 10
    );
```

By default, MockData will return **10** objects. You can also specify a random number by using the form: `rnd:X`

```js
http://localhost:3000/?num=rnd:10

# object
var data = getInstance( "MockData@MockDataCFC" )
    .mock(
        num = "rnd:10"
    );
```

This will return a random number of objects from 1 to 10. If you want to specify your own range, just use the form: `rnd:X:Y`

```js
http://localhost:3000/?num=rnd:5:10

# object
var data = getInstance( "MockData@MockDataCFC" )
    .mock(
        num = "rnd:5:10"
    );
```

### Type of data

In order to define the type of data returned, you must specify one or more additional query string variables or arguments. The form is `name=type`, where `name` will be the name used in the result and `type` is the type of data that we support. Here is a simple example:

```js
http://localhost:3000/?num=3&author=name

# object
var data = getInstance( "MockData@MockDataCFC" )
    .mock(
        num = 3,
        author = "name"
    );
```

This tells the service to return 3 objects with each containing an `author`field that has a type value of `name`. (More on types in a minute.) The result then would look something like this:

```json
[
{
author: "Frank Smith"
},
{
author: "Gary Stroz"
},
{
author: "Lynn Padgett"
}
]
```

Additional fields than can just be appended to the URL or method call:

```json
http://localhost:3000/?num=3&author=name&gender=oneof:male:female

# object
var data = getInstance( "MockData@MockDataCFC" )
    .mock(
        num = 3,
        author = "name",
        gender = "oneOf:male:female"
    );
```

Which gives...

```json
[
{
author: "Lisa Padgett",
gender: "male"
},
{
author: "Roger Clapton",
gender: "male"
},
{
author: "Heather Degeneres",
gender: "male"
}
]
```

### Types

The available types MockDataCFC supports are:

* `age`: Generates a random "adult" age of 18 to 75.
* `all_age`: Generates a random age of 1 to 100.
* `autoincrement` : Returns an incremented index starting from 1
* `baconlorem`: Returns bacon lorem ipsum text. If used as `baconlorem:N`, returns N paragraphs. If used as `baconlorem:X:Y`, returns a random number of paragraphs between X and Y.
* `date`: Generates a random date
* `datetime`: Generates a random date and time value
* `email`: Generates a random email.
* `fname`: Generates a random first name.
* `name`: Generates a random name.
* `lname`: Generates a random last name.
* `lorem`: Returns lorem ipsum text. If used as `lorem:N`, returns N paragraphs. If used as `lorem:X:Y`, returns a random number of paragraphs between X and Y.
* `num`: By default, a number from 1 to 10. You can also use the form num:X for a random number between 1 and X. Or num:X:Y for a random number between X and Y.
* `oneof:x:y`: Requires you to pass N values after it delimited by a colon. Example: `oneof:male:female`. Will return a random value from that list.
* `rnd:N`, `rand:N`, `rnd:x:y`, `rand:x:y` : Generate random numbers with a specific range or range cap.
* `sentence`: Generates a sentences. If used as `sentence:N`, returns N sentences.  If used as `sentence:X:Y`, returns a random number of sentences beetween X and Y.
* `ssn`: Generates a random Social Security number.
* `string`: Just returns the word `string`
* `tel`: Generates a random (American) telephone number.
* `uuid`: Generates a random UUID
* `words`: Generates a single word. If used as `word:N`, returns N words.  If used as `words:X:Y`, returns a random number of words beetween X and Y.