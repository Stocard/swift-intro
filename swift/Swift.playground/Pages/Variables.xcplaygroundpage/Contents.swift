
/*:
 # Variables and types
 */

/*:
 Types are inferred
 */

var lunchName = "Tacos"
// later: let lunchName = "Tacos"
var price = 3.5
var isFeatured = true

/*:
 Types can be set explicitly
 */

var comment: String = "Delicious"
var rating: Int = 4
// later: var rating: Int? = 4

/*:
 Types cannot be changed
 */

rating = "Perfect"
rating = 4.5

/*:
 Non-optional types cannot be nil
 */

rating = nil

/*:
 Let cannot be re-assigned
 */

lunchName = "Burger with Fries"

/*:
 Var can be reassigned
 */

comment = "Disguisting! Found a snail in my tacos"
rating = 1

/*:
 Optionals can have a value or be nil
 */

rating = nil

/*:
 Functions
 */

// have external and internal parameters names
// external names can be inferred automatically
// have return types

func createDescription(rating rating: Int, withComment comment: String) -> String {
    var combined = ""
    for _ in 1...rating {
        combined += "⭐️"
    }
    combined += " \(comment)"
    return combined
}

/*:
 Handling optionals
 */

// Calling directly does not work
let combined = createDescription(rating: rating, withComment: comment)

// Forced unpwrapping
let combined = createDescription(rating: rating!, withComment: comment)

// Optional binding
if let rating = rating {
    let combined = createDescription(rating: rating, withComment: comment)
}
