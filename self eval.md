# Self Eval

## Functionality

My Enigma project meets expectations. It can encrypt, decrypt, and all command line functions work properly. It can deal with things like numbers, symbols, and upper case letters without losing functionality. The decrypt method will autogenerate a date and key if none is provided. The key will maintain leading zeros if a lower number is generated.

## Object Oriented Programming

My program is broken down into 5 classes, each with a distinct set of responsibilities. All classes are less than 100 lines of code and interact throughout the Enigma program, while still encapsulating data and methods. For example, my **Message** class methods that are utilized during encryption and decryption live in the message class. If a method acts on an object, it lives in that class. Each class interacts, but has a specific job.

## Ruby Conventions and Mechanics

My code is easy to read and understand. All methods are less than 7 lines long. Helper methods are used to break up longer chains of logic, making the code easier to read and understand. Spacing and indentation is consistent throughout all classes and spec files. I use a hash to assign letters in the message to their index position. This hash is then used in my encryption and decryption logic to reduce complexity.

## Test Driven Development

All methods are both unit and integration tested. I tested for outliers such as capital letters, symbols, and numbers. Both the date generator and random digit method also meet requirements and were tested thoroughly. Coverage according to simplecov is 100%. I used mocks and stubs in a few instances as well as a 'mock' file to test my file reading method. All tests were written prior to code implementation.
