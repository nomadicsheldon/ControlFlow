import UIKit

// For-in loop

// iterating in array

let names = ["Himanshu", "Shivanshu", "Aman", "Ayush"]
for name in names {
    print(name)
}

// iterating in dictionary

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (name, legCount) in numberOfLegs {
    print("\(name)s has \(legCount) legs")
}

// sequencing

for idx in 1...5 {
    print(idx)
}

// if you don't need values
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

// half open range

let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark)
}

// stride function to skip unwanted marks

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("interval \(tickMark)")
}

// stride close range

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print("close range \(tickMark)")
}

//----------------------------------------------------------------------------------------------//

// while loop

// Snakes and ladders game

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare+1)
print(board.count)
// board started with 26 zero Int because player starts from 0

// snake and ladder position

// ladder
board[03] = +08; board[06] = +011; board[09] = +09; board[10] = +02

// snakes
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;

// code
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {diceRoll == 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}

// in above code diceRoll is not random, its increasing one by one.
print("Game over!")

//----------------------------------------------------------------------------------------------//

// repeat while loop
square = 0
diceRoll = 0

repeat {
    // move up and down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll == 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")

//----------------------------------------------------------------------------------------------//

// conditional statement

// If

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
    print("it's cold here.")
} else if temperatureInFahrenheit >= 86 {
    print("it's really warm here.")
}
// else is optional
else {
    print("It's not that cold.")
}


//----------------------------------------------------------------------------------------------//

// Switch

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("the first letter of alphabet")
case "z":
    print("the last letter of the alphabet")
default:
    print("some other character")
}

//----------------------------------------------------------------------------------------------//

// No implicit fallthrough

switch someCharacter {
case "a", "A":
    print("the first letter of alphabet")
case "z":
    print("the last letter of the alphabet")
default:
    print("Not the letter A")
}

//----------------------------------------------------------------------------------------------//

// Interval Matching

let approximateCount = 62
let countThings = "moons orbiting saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozons of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

//----------------------------------------------------------------------------------------------//

// Tuples

let somePoint = (1, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on x-axis")
case (0,_):
    print("\(somePoint) is on y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//----------------------------------------------------------------------------------------------//

// Value binding

let anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at \(x), \(y)")
}
//----------------------------------------------------------------------------------------------//

// where

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("\(x), \(y) is just some arbitrary point")
}

//----------------------------------------------------------------------------------------------//

// compound Cases

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel.")
case "b", "c":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel for sure")
}

// compound Cases can also use value binding

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//----------------------------------------------------------------------------------------------//

// control transfer statement

// continue - it will move to next iteration

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}

// Break

let numberSymbol: Character = "#"
var possibleIntegerValue: Int?

switch numberSymbol {
case ",", ".":
    possibleIntegerValue = 1
case ":", ";":
    possibleIntegerValue = 2
case "!", "`":
    possibleIntegerValue = 3
case "@", "$":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

//----------------------------------------------------------------------------------------------//

// Fallthrough

let integerToDescribe = 5
var describe = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,5,7,11,13,17,19:
    describe += " a prime number, and also"
    fallthrough
case 12:
    describe += "qwqwq"
default:
    describe += " an integer"
}

//----------------------------------------------------------------------------------------------//

// Labeled Statements

square = 0
diceRoll = 0

//gameLoop: while square != finalSquare {
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll == 1
//    }
//    switch square + diceRoll {
//    case finalSquare:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        continue gameLoop
//    default:
//        square += diceRoll
//        square += board[square]
//    }
//}

print("Game over!")

//----------------------------------------------------------------------------------------------//

// Early Exit

func greet(person: [String: String]) {
    guard let name = person["name"] else { return }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the whether is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "Himanshu"])
greet(person: ["name": "Himanshu", "location": "Bangalore"])

//----------------------------------------------------------------------------------------------//

// checking API Availability

if #available(iOS 10, macOS 10.12,*) {
    // use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
