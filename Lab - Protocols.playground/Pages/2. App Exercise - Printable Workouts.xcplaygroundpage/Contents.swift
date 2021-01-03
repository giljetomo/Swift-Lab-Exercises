/*:
 ## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
class Workout: CustomStringConvertible, Equatable, Comparable, Encodable {
    static func < (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier < rhs.identifier
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var distance: Double
    var time: Double
    var identifier: Int
    
    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }
    
    var description: String {
        return "Identifier: \(identifier), Distance: \(distance), Time: \(time)"
    }
}

let a = Workout(distance: 1.5, time: 2, identifier: 1)
/*:
 Make the `Workout` class above conform to the `CustomStringConvertible` protocol so that printing an instance of `Workout` will provide useful information in the console. Create an instance of `Workout`, give it an identifier of 1, and print it to the console.
 */
print(a)

/*:
 Make the `Workout` class above conform to the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates to whether or not it is equal to the first `Workout` instance you created.
 */
let b = Workout(distance: 2.9, time: 1, identifier: 2)
print(a == b)

/*:
 Make the `Workout` class above conform to the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier. 
 
 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5, respectively. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place these objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier. 
 */
let c = Workout(distance: 2.3, time: 1, identifier: 3)
let d = Workout(distance: 4.2, time: 4.5, identifier: 4)
let e = Workout(distance: 5.4, time: 3.4, identifier: 5)
let workouts: [Workout] = [c, a, e, d, b]
let sortedWorkouts = workouts.sorted(by: <)
print(sortedWorkouts)

/*:
 Make `Workout` adopt the `Codable` protocol so you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String`, and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(d), let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

//: [Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
