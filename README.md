# Valid value objects

Dart package to create immutable validated value objects with the benefit of type safety and code readability.

## Table of contents
* [Overview](#overview)
* [Exceptions](#exceptions)
* [Object creation](#object-creation)
* [Customization](#customization)
* [Serialization](#serialization)

## Overview
You might be familiar with Value Objects from DDD concepts.
Value Objects provides
* immutability
* type safety
* code readability
* validation
    * Objects are only instantiated if input parameter(s) are valid.
    * Making invalid value objects unrepresentable.

The package provides the following value objects:
* EmailAddress
* IPAddress
* ISBN
* Name, FirstName, MiddleName, LastName
* Password
* PhoneNumber
* UniqueId, TimeId

*Note: Create your own value object by extending ValueObject class*

## Exceptions
Some examples on how to create value objects.

### Possible expections at object creation:
* RequiredValueException
* InvalidValueException
* TooShortValueException
* TooLongValueException

*Note: All of the above exceptions are instance of ValueException.*

## Object creation

### **EmailAddress**

`EmailAddress` instantiation:

```dart
try {
  EmailAddress e = EmailAddress('example@gmail.com');
} on RequiredValueException {
  // happens if param is null or empty
} on InvalidValueException {
  // happens if param doesn't match regex
}

// OR handle all exception at once:

try {
   EmailAddress e = EmailAddress('example@gmail.com');
} on ValueException catch (e) {  
  // catches all value exceptions
  print(e.invalidValue);
  print(e.code);
  print(e.message);
}

// OR don't handle exceptions at all if you're sure that the value is correct.
```

## Customization

### **Password**
You may want to configure the default password requirements.

```dart
// Requirements can be set one by one:

Password.minChar = ...;
Password.maxChar = ...;
Password.mustContainUpperChar = ...;
Password.mustContainNumeric = ...;
...

// OR you can set it using the following method:

Password.setRequirements(
  minChar: 10, // default: 8
  maxChar: 50, // default: 255
  mustContainLowerChar: false, // default: true
  mustContainNumeric: false, // default: true
  mustContainUpperChar: false, // default: true
  mustContainSpecialChar: false, // default: false
);
```

### **Custom validators**
```dart
EmailAddress.customValidator = (str) => str.contains('@');   
PhoneNumber.customValidator = (str) { ... };
FirstName.customValidator = (str) => ...;
```

If you define a `customValidator` the class's factory constuctor(s) and validator function(s) will validate by your custom validator instead of the default one.

## Serialization
Above validation and type safety every value object provides a `toJson` and `fromJson` method. By that fact, storing them in a NoSQL database is easy. The package is compatible with `json_serialization` package, but the package on it's own does not depend on it.

Costumize the `key` fields if required. Every value object has a `static` `key` field which are used by `toJson` and `fromJson` functions.

Default keys:
* EmailAddress: "email"
* Name: "name"
* FirstName: "firstName"
* MiddleName: "middleName"
* LastName: "lastName"
* IPAddress: "ip"
* ISBN: "isbn"
* Password: "password"
* PhoneNumber: "phone"
* UniqueId: "id"

Finding a `key` in a nested `Map` object? No problem.

```dart
const simpleMap = {'email' : 'xy@gmail.com'};
const nestedMap = {
  'person' : {
    'contact' : {
      'phone' : '...',
      'email' : 'xy@gmail.com',
    },
  },
};

EmailAddress.fromJson(simpleMap) == EmailAddress.fromJson(nestedMap) // true
```

**Check the *example* folder for more clarification.**

*Please feel free to open an issue if you have a feature request or some useful thoughts about the package: https://github.com/mstfkhazaal/valid_value_object/issues*