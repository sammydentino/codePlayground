import UIKit

var str = "Hello, playground" // :)

/*  Simple Values */
//variable declarations
var myVariable = 42
myVariable = 50
let myConst = 42

//setting a variable type
let implicitDouble = 70.0
let explicitDouble: Double = 70

//experiment 1:
let myFloat: Float = 4

//casting a variable type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//casting alternative
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//arrays
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

//array with key (dictionary)
var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public relations"

//empty arrays & dictionaries
let emptyArray = String()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = [] //another empty array but with type inference

/* Control Flow */
//if statements
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores
{
    if score > 50
    {
        teamScore += 3;
    }
    else
    {
        teamScore += 1;
    }
}
teamScore

//optional values
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName
{
    greeting = "Hello, \(name)"
}
else
{
    greeting = "Sorry, there is no one to greet!"
}

//switch statements
let vegetable = "red pepper"
switch vegetable
{
case "celery":
    _ = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    _ = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    _ = "Is it a spicy \(x)?"
default:
    _ = "Everything tastes good in soup."
}
// _ can be used instead of a variable name in swift

//for-in loop to iterate over items in a dictionary
let interestingNumbers =
[
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var kind2: String? = ""
for (kind, numbers) in interestingNumbers
{
    for number in numbers
    {
        if number > largest
        {
            largest = number
            kind2 = kind
        }
    }
}
largest
kind2

//while loop
var n = 2
while n < 100
{
    n = n << 1
    //n = n * 2
}
n

//do-while is called a repeat-while loop
var m = 2
repeat
{
    m = m << 1
} while m < 100
m

//ranges in loops
var firstForLoop = 0
for i in 0..<3
{
    firstForLoop += i
}
firstForLoop

/* Functions and Closures */
//functions
func greet(person: String, day: String) -> String
{
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int)
{
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores
    {
        if score > max
        {
            max = score
        }
        else if score < min
        {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

func returnFifteen() -> Int
{
    var y = 10;
    func add()
    {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int)
{
    func addOne(number: Int) -> Int
    {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool
{
    for item in list
    {
        if condition(item)
        {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool
{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//closures -> not too sure what these do
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted{ $0 > $1 }
print(sortedNumbers)

/* Objects and Classes */
class Shape
{
    var numberOfSides = 0
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//first shape class is missing an initializer!
class NamedShape
{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) //initializer; deinit is a deinitializer
    {
        self.name = name //self.name says were changing the name value for the exact class, and not modifying the name recieved as input
    }
    
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape
{
    var sideLength: Double
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength //sets class side length
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double
    {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String
    {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "Test Square")
test.area()
test.simpleDescription()

class EquTriangle: NamedShape
{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double
    {
        get
        {
            return 3.0 * sideLength
        }
        set
        {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String
    {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquTriangle(sideLength: 3.1, name: "Test Triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare
{
    var triangle: EquTriangle
    {
        willSet
        {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var square: Square
    {
        willSet
        {
            square.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String)
    {
        square = Square(sideLength: size, name: name)
        triangle = EquTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "Test Shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "Larger Square")
print(triangleAndSquare.square.sideLength)
let optionalSquare: Square? = Square(sideLength: 2.5, name: "Optional Square")
let sideLength = optionalSquare?.sideLength

/* Enumeration and Structures */
enum Rank: Int
{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String
    {
        switch self
        {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .king:
            return "king"
        case .queen:
            return "queen"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

enum Suit
{
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String
    {
        switch self
        {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String
    {
        switch self
        {
        case .spades:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        case .clubs:
            return "black"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

enum serverResponse
{
    case result(String, String)
    case failure(String)
}

let success = serverResponse.result("6:00AM", "8:09PM")
let failure = serverResponse.failure("HTTP://404 Error")

switch success
{
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}

//structs for structures
struct Card
{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String
    {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDesc = threeOfSpades.simpleDescription()

/* Protocols and Extensions */
protocol exampleProtocol //classes, enums, and structs can all adopt protocols
{
    var simpleDescription: String { get }
    mutating func adjust()
}

public class simpleClass: exampleProtocol
{
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust()
    {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = simpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct simpleStruct: exampleProtocol
{
    var simpleDescription: String = "A simple structure."
    mutating func adjust()
    {
        simpleDescription += " (adjusted)"
    }
}
var b = simpleStruct()
b.adjust()
let bDescription = b.simpleDescription

extension Int: exampleProtocol
{
    var simpleDescription: String
    {
        return "The number \(self)"
    }
    mutating func adjust()
    {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: exampleProtocol = a
print(protocolValue.simpleDescription)

/* Error Handling */
//defining errors
enum printerError: Error
{
    case outOfPaper
    case noToner
    case onFire
}

//throws after func send() == throwsException in java
func send(job: Int, toPrinter printerName: String) throws -> String
{
    if printerName == "Never has toner."
    {
        throw printerError.noToner
    }
    return "Job sent."
}

//do-catch == try-catch from java
do
{
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
}
catch
{
    print(error)
}

do
{
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
}
catch printerError.onFire
{
    print("I'll just put this over here with the rest of the fire.")
}
catch let printError as printerError
{
    print("Printer error: \(printError).")
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never has toner.")

//"autoclosing" fridge
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool
{
    fridgeIsOpen = true;
    defer
    {
        fridgeIsOpen = false;
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("Banana")
print(fridgeIsOpen)

/* Generics */
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item]
{
    var result = [Item]()
    for _ in 0..<numberOfTimes
    {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//swift library optional type
enum optionalValue<Wrapped>
{
    case none
    case some(Wrapped)
}
var possibleInteger: optionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs
    {
        for rhsItem in rhs
        {
            if lhsItem == rhsItem
            {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
