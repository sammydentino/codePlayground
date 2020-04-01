//variables
var myVar: Int = 42
var myString: String = "Sammy"

//constants
let myConstant: Double = 64.5

/*
Swift includes the following data types:
- Int -> whole nums
- Float -> includes decimals
- Double -> floats w/ double precision -> better than float
- String
- Boolean
*/

//optional strings
var optionalMessage: String?

//example function
func greetUser(name: String, bySaying greeting:String = "Hello!") -> String
{
	return "\(greeting), \(name)"
}

//call function like this:
let message = greetUser(name: "Sammy", bySaying: "Keep coding!")

/*
Swift operators:
a + b -> addition (works for strings)
a - b -> subtraction
a * b -> multiplication
a / b -> division
a % b -> remainder (or use isMultiple(of:))
-a -> negative (invert sign)

! There is no ++ or -- !
n += 1;
n -= 1;
+= works for arrays too
*/

var rappers = ["Eminem", "Jay-Z", "Snoop Dogg"]
rappers += ["Tupac"]

/*
Swift comparison operators:
a == b -> equality
a != b -> inequality
a > b -> greater than
a < b -> less than
a >= b -> greater than or equal to
a <= b -> less than or equal to

Identity operators:
=== & !== tests if two variables reference the exact same object

Logical operators:
&&, ||, !x

Range operators:
a...b -> closed ranged = range from a to b including b
a..<b -> half-open range = range a to b not including b

One sided ranges:
* Important for use in arrays! *
array[a...] -> range from a till end of array
array[...a] -> range from beginning of array till a
array[..<a] -> range from beginning of array till a not including a
*/

//classes
class Office
{
    var address: String = "1 Infinite Loop"
	var phone: String?
	
	@IBOutlet weak var submitButton:UIButton?
	
	lazy var articles:String = "Hi"
	
	override init() //overrides from Building inheriting all its functions
	{
		address = "1 Probability Drive"
	}
	
	func startWorking(_ time:String, withWorkers workers:Int)
	{
		print("Starting working at time \(time) with workers \(workers)")
	}
}

//instance of class 
let buildingA = Office()
buildingA.address = "123 Test Lane"

//extensions -> let you add functions to existing types (to not modify code of a class)
extension Building
{
	func evacuate()
	{
		print("Please leave the building in an orderly fashion.")
	}
}
