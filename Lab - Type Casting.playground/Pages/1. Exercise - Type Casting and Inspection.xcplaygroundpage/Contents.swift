/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let collection: [Any] = [1.2, 3.2, 10, "S", true, false]
//print(collection)

/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
//for item in collection {
//    if item is Int {
//        print("\(item) is an Integer")
//    } else if item is Double {
//        print("\(item) is a Double")
//    } else if item is Bool {
//        print("\(item) is Bool")
//    }
//}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let str: [String: [Any]] = ["Double": [1.0, 2.0], "Integer": [9], "String": ["2.0", "S", "3.0"], "Bool": [true, false]]
//
//for (cat, items) in str {
//    for i in items {
////        print(cat, i)
//    }
//}

/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0

for(_, items) in str {
    for i in items {
        
        if let value = i as? Double {
            total += value
        }
        if let value = i as? Int {
            total += Double(value)
        }
        if let value = i as? Bool {
            total += (value ? 2.0 : -3.0)
        }
        if let _ = i as? String {
            total += 1
        }
    }
}

//print(total)
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0

for(_, items) in str {
    for i in items {
        if let a = i as? String, let b = Double (a) {
            total2 += b
        } else if let i = i as? Double {
            total2 += i
        } else if let i = i as? Int {
            total2 += Double (i)
        }
    }
}

print(total2)


//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
