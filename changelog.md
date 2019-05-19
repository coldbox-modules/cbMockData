# Changelog

## 3.1.0

* CommandBox ability to execute
* Template updates to standards

## 3.0.0

* **Compatibility** : `num` arguments have been dropped and you must use `$num` as the identifier for how many items you like
* Introduction of nested mocking. You can now declare nested mocks as structs and the mock data will nest accordingly:

```js
getInstance( "MockData@MockDataCFC" )
	.mock(
		books=[{
			num=2,
			"id"="uuid",
			"title"="words:1:5"
		}],
		fullName="name",
		description="sentence",
		age="age",
		id="uuid",
		createdDate="datetime"
	);
```

This will produce top level mock data with 2 books per record.

* Nested Data for array of objects, array of values and simple objects
* ACF Compatibilities
* Updated readmes and syntax updates for modern engines
* Upgraded to new ColdBox module Harness

## 2.4.0

* Added auto-incrementing ID's FOR REAL this time

## 2.3.0

* Added auto-incrementing ID's
* Update on build control
* Syntax Ortus Updates, addition of private methods
* allow for use of `rand` or `rnd` for `num` generators
* Add CORS support for ColdBox REST Module
* Bug on `isDefault()` always returning true.
* Added tests and automation

## 2.2.0

* Made it a module as well for ColdBox apps.

## 2.0.0

* Added support for words, sentences, uuid, bacon lorem, date and datetime
* Added CommandBox Support
* Added Documentation
* Added ability to execute as a CFC instead of only via web service

## 1.0.0

Original by Ray Camden
